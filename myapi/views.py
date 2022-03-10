import ast
import json
import time
from datetime import datetime
from io import BytesIO
from apscheduler.schedulers.background import BackgroundScheduler
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from django.http import JsonResponse, HttpResponse, StreamingHttpResponse
import uuid
from django.core.exceptions import ObjectDoesNotExist
from django_apscheduler.jobstores import DjangoJobStore, register_events
from django_apscheduler.models import DjangoJob
import xlsxwriter
from myapi.models import *
import requests
import json
import threading
import requests
from myapi.base.task import ApiTask
from myapi.base.element import Element
import os

from mysite import settings


def check_login(func):  # 自定义登录验证装饰器
    def warpper(request, *args, **kwargs):
        token = request.META.get("HTTP_AUTHORIZATION")
        print("check_login")
        # print(token)
        # 得到token实体类
        try:
            token_entry = Token.objects.get(name=token)
        except ObjectDoesNotExist:
            token_entry = None
        # 如果查到有token就是已经登陆了
        if token_entry:
            return func(request, *args, **kwargs)
        else:
            # return redirect("/login")
            print("==============403===")
            return JsonResponse({'code': 403, 'msg': 'not login'})

    return warpper


@check_login
def index(request):
    # return render(request, 'login/index.html')
    return JsonResponse({'code': 2, 'msg': 'this is index msg'})


# @csrf_exempt
def login(request):
    """
    登陆
    """
    req_token = request.META.get("HTTP_AUTHORIZATION")
    print("========login=========")
    print(req_token)
    data = json.loads(request.body)
    user_name = data.get('username')
    pwd = data.get("pwd")
    if not user_name or not pwd:
        return JsonResponse({"code": -1, "msg": "username and pwd must fill in"})

    try:
        user = User.objects.get(name=user_name)
        if not user:
            return JsonResponse({'code': -1, 'msg': 'login is fail'})

        # 得到token实体类
        try:
            token_entry = Token.objects.get(name=req_token)
            # 如果查到有token就是已经登陆了
            if token_entry:
                return JsonResponse({'code': 1, 'msg': 'already success'})
        except ObjectDoesNotExist:
            pass

        if user.password != pwd:
            return JsonResponse({'code': -1, 'msg': 'login is fail'})
        # 登陆成功后写token
        if user.password == pwd:
            token = str(uuid.uuid1())
            # 如果token存在就修改
            try:
                token_entry = Token.objects.get(user_id=user.id)
            except ObjectDoesNotExist:
                token_entry = None

            if token_entry:
                token_entry.name = token
                token_entry.save()
            else:
                Token(name=token, user=user).save()
            result = {'code': 1, 'msg': 'login is success', 'token': token}
            return JsonResponse(result)

    except ObjectDoesNotExist:
        result = {'code': -2, 'msg': 'check user or pwd'}
        return JsonResponse(result)


def loginout(request):
    """
    退出登陆
    """
    req_token = request.META.get("HTTP_AUTHORIZATION")
    try:
        token_entry = Token.objects.get(name=req_token)
        if token_entry:
            token_entry.delete()
            return JsonResponse({"code": 1, "msg": "login out is success"})
        else:
            return JsonResponse({"code": - 1, "msg": "login out is fail"})
    except ObjectDoesNotExist:
        return JsonResponse({"code": 1, "msg": "login out is success"})


@check_login
def get_role_list(request):
    """
    得到角色列表
    """
    res = Role.objects.all()
    resp = []
    for i in res:
        if i.name == "comm":
            role_name = "普通用户"
        else:
            role_name = "超级用户"
        resp.append({"id": i.id, "role_name": role_name})
    return JsonResponse({"code": 1, "msg": "success", "data": resp})


@check_login
def users(request, id):
    """
    用户详情
    """
    try:
        user_entry = User.objects.get(id=id)
        role_entry = Role.objects.get(id=user_entry.role_id)
        if role_entry.name == "comm":
            role_name = "普通用户"
        else:
            role_name = "超级用户"
        data = {"user_name": user_entry.name, "role_id": user_entry.role_id, "role_name": role_name,
                "pwd": user_entry.password}

        return JsonResponse({"code": 1, "msg": "success", "data": data})

    except ObjectDoesNotExist:
        return JsonResponse({"code": -1, "msg": "no effect row"})


@check_login
def user_del(request):
    """
    删除用户
    """
    data = json.loads(request.body)
    id = data.get("id")
    if not id:
        return JsonResponse({"code": -1, "msg": "id must be fill"})
    try:
        user_entry = User.objects.get(id=id)
        if not user_entry:
            return JsonResponse({"code": -1, "msg": "no effect row"})
        user_entry.delete()
        return JsonResponse({"code": 1, "msg": "success"})

    except ObjectDoesNotExist:
        return JsonResponse({"code": -1, "msg": "no effect row"})


@check_login
def user_edit(request):
    """
    编辑用户
    """
    data = json.loads(request.body)
    user_name = data.get('username').strip()
    pwd = data.get("pwd").strip()
    role_id = data.get("roleId")
    ids = data.get("id")
    if not user_name and not pwd and not role_id:
        return JsonResponse({"code": -1, "msg": "username,pwd,role must be fill"})
    try:
        user_entry = User.objects.get(id=ids)
        if not user_entry:
            return JsonResponse({"code": -1, "msg": "no effect row"})
        user_entry.role_id = role_id
        user_entry.name = user_name
        user_entry.password = pwd
        user_entry.save()
        return JsonResponse({"code": 1, "msg": "success"})

    except ObjectDoesNotExist:
        return JsonResponse({"code": -1, "msg": "no effect row"})


@check_login
def user_add(request):
    """
    新增用户
    """
    data = json.loads(request.body)
    user_name = data.get('username').strip()
    pwd = data.get("pwd").strip()
    role_id = data.get("roleId")
    if not user_name and not pwd and not role_id:
        return JsonResponse({"code": -1, "msg": "username,pwd,role must be fill"})
    try:
        check_user_name = User.objects.get(name=user_name)
        if check_user_name:
            return JsonResponse({"code": -1, "msg": "username is exists"})
    except ObjectDoesNotExist:
        pass
    User(name=user_name, password=pwd, role_id=role_id).save()
    return JsonResponse({"code": 1, "msg": "success"})


@check_login
def get_user_list(request):
    """
    用户列表
    """
    data = request.GET
    query = data.get("query")  # 查询条件
    page_num = data.get("pagenum")  # 当前页码
    page_size = data.get("pagesize")  # 每页多少条
    # users = User.objects.exclude(role_id=1)
    # users = User.objects.filter(type__name__contains='python')
    if query:
        users = User.objects.filter(name__contains=query)

    else:
        users = User.objects.all().order_by("-c_time")
    response = {}
    # 生成分页实例
    paginator = Paginator(users, page_size)
    # 获取数据总条数
    response['total_count'] = paginator.count
    # 每页显示条数
    response['page_size'] = page_size
    # 总共页数
    response['total_page'] = paginator.num_pages
    response["list"] = []
    try:
        users = paginator.page(page_num)
    except PageNotAnInteger:
        users = paginator.page(1)
    except EmptyPage:
        users = paginator.page(paginator.num_pages)
    # 当前多少页
    response['pageNum'] = users.number
    # 获取数据
    for i in users.object_list:
        role = Role.objects.get(id=i.role_id)
        if role.name == "comm":
            role_name = "普通用户"
        else:
            role_name = "超级用户"
        if i.name != "admin":
            response["list"].append({"name": i.name, "role_name": role_name, "id": i.id})
    res = {'code': 1, 'msg': '获取成功', 'data': response}
    # 将数据返回到页面
    return JsonResponse(res)


@check_login
def login_save(request):
    """
    测试api接口需要提前登陆的准备数据
    """
    data = json.loads(request.body)
    url = data.get("url")
    param = data.get("param")
    method = "post"
    try:

        if url or param or method:
            return JsonResponse({'code': -1, 'msg': 'url,param,method must be fill'})
        l = ApiLogin.objects.get(pk=1)
        if not l:
            ApiLogin(url=url, param=param, method=method).save()
        else:
            l.url = url
            l.params = param
            l.save()
        result = {'code': 0, 'msg': '保存成功'}
        return JsonResponse(result)
    except ObjectDoesNotExist:
        ApiLogin(url=url, param=param, method=method).save()
        result = {'code': 0, 'msg': '保存成功'}
        return JsonResponse(result)


@check_login
def login_test(request):
    """
    对api登陆接口进行测试
    """
    try:
        lg = ApiLogin.objects.get(pk=1)
        if not lg:
            result = {'code': -1, 'msg': 'please check login param is success?'}
            return JsonResponse(result)
        param = json.loads(lg.param)
        req = requests.session()
        resp = req.post(lg.url, data=param)
        try:
            result = {'code': -1, 'msg': "success", "data": json.loads(resp.text)}
            return JsonResponse(result)
        except Exception as e:
            result = {'code': -1, 'msg': str(e)}
            return JsonResponse(result)
    except ObjectDoesNotExist:
        result = {'code': -1, 'msg': 'please check login param is success?'}
        return JsonResponse(result)


@check_login
def reports_module_case(request):
    """
    测试报告-图形展示-模块用例数量
    """
    data = []
    suites = Suite.objects.all()
    for i in suites:
        cases_list = SuiteSetCase.objects.filter(suite_id=i.id)
        num = len(cases_list)
        data.append({"id": i.id, "name": i.name, "num": num})
    xAxis_data = []
    series_data = []
    for i in data:
        xAxis_data.append(i["name"])
        series_data.append(i["num"])
    resp = {}
    resp["title"] = {"text": "套件用例统计"}
    resp["tooltip"] = {}
    resp["xAxis"] = {"data": xAxis_data}
    resp["yAxis"] = {}
    resp["series"] = [{"name": "套件", "type": "bar", "data": series_data}]

    # 将数据返回到页面
    return JsonResponse({'code': 1, 'msg': '获取成功', 'data': resp})


@check_login
def reports_top_10_slow(request):
    """
    响应时间最慢的top10
    """
    rp = ReportItem.objects.all().order_by("-sum_time")[:10]
    resp = []
    for i in rp:
        if i.result == 1:
            result = "通过"
        elif i.result == -1:
            result = "失败"
        else:
            result = "无检查点"
        resp.append({"name": i.name, "result": result, "sum_time": i.sum_time})
    return JsonResponse({'code': 1, 'msg': '获取成功', 'data': resp})


@check_login
def reports_top_slow_export(request):
    data = []
    # 每次都删除excel，然后重建
    name = "top10慢的接口"
    excel_name = os.path.join(Element.REPORT_FILE, name) + ".xlsx"
    if os.path.exists(excel_name):
        os.remove(excel_name)
        print("文件已经删除" + excel_name)

    with open(excel_name, 'a+', encoding="utf-8") as f:
        print("创建文件成功" + excel_name)

    item_entry = ReportItem.objects.all().order_by("-sum_time")[:10]

    for i in item_entry:
        url = i.protocol + "//" + i.url
        if i.result == 1:
            result = "通过"
        else:
            result = "失败"

        data.append({"url": url, "params": i.params, "name": i.name, "method": i.method, "hope": i.hope,
                     "result": result, "sum_time": i.sum_time + "ms", "fact": i.fact})

        workbook = xlsxwriter.Workbook(excel_name, {"string_to_urls": False})
        worksheet = workbook.add_worksheet("响应时间最慢的top10")
        worksheet.write("A1", "用例名")
        worksheet.set_column("B:B", 60)
        worksheet.write("B1", "url")
        worksheet.write("C1", "请求方法")
        worksheet.write("D1", "入参")
        worksheet.write("E1", "期望结果")
        worksheet.write("F1", "实际结果")
        worksheet.set_column("F:F", 60)
        worksheet.write("G1", "是否通过")
        worksheet.write("H1", "耗时")
        temp = 2
        for j in data:
            worksheet.write("A" + str(temp), j["name"])
            worksheet.write("B" + str(temp), j["url"])
            worksheet.write("C" + str(temp), j["method"])
            worksheet.write("D" + str(temp), j["params"])
            worksheet.write("E" + str(temp), j["hope"])
            worksheet.write("F" + str(temp), j["fact"])
            worksheet.write("G" + str(temp), j["result"])
            worksheet.write("H" + str(temp), j["sum_time"])
            temp += 1
        workbook.close()

    file_name1 = os.path.join(settings.BASE_DIR, "myapi/Report",name + ".xlsx")
    file = open(file_name1, 'rb')
    response = StreamingHttpResponse(file)
    response['Content-Type'] = 'application/octet-stream'
    response['Content-Disposition'] = 'attachment;filename="{}"'.format(name)
    # file.close()

    return response


@check_login
def report_task(request):
    """
    测试报告-图形展示-每个任务中的成功和失败用例
    """
    resp = {}
    xAxis_data = []  # 任务名
    # 只统计测试完成后的任务
    passed1 = []
    failed1 = []

    report = Report.objects.all()
    for i in report:
        ta = Task.objects.get(id=i.task_id)
        if ta.task_state == 2:
            xAxis_data.append(i.name)
            if i.passed:
                passed1.append(i.passed)
            if i.failed:
                failed1.append(i.failed)

    resp["xAxis_data"] = xAxis_data
    resp["passed"] = passed1
    resp["failed"] = failed1

    return JsonResponse({'code': 1, 'msg': '获取成功', 'data': resp})


@check_login
def reports_list(request):
    """
        测试报告-所有的测试报告列表
        """
    data = request.GET
    query = data.get("query")  # 查询条件
    page_num = data.get("pagenum")  # 当前页码
    page_size = data.get("pagesize")  # 每页显示多少条
    if query:
        reports = Report.objects.filter(name__contains=query)

    else:
        reports = Report.objects.order_by("-id")
    response = {}
    # 生成分页实例
    paginator = Paginator(reports, page_size)
    # 获取数据总条数
    response['total_count'] = paginator.count
    # 每页显示条数
    response['page_size'] = page_size
    # 总共页数
    response['total_page'] = paginator.num_pages
    response["list"] = []
    try:
        reports_pagi = paginator.page(page_num)
    except PageNotAnInteger:
        reports_pagi = paginator.page(1)
    except EmptyPage:
        reports_pagi = paginator.page(paginator.num_pages)
    # 当前多少页
    response['pageNum'] = reports_pagi.number
    # 获取数据
    for i in reports_pagi.object_list:
        response["list"].append(
            {"name": i.name, "id": i.id, "sum_time": i.sum_time, "passed": i.passed, "start_time": i.start_time,
             "failed": i.failed}
        )
    res = {'code': 1, 'msg': '获取成功', 'data': response}
    return JsonResponse(res)


@check_login
def report_export(request, id):
    """
    导出测试报告为excel
    id 为report的id
    """
    data = []
    report_entry = Report.objects.get(id=id)
    excel_name = os.path.join(Element.REPORT_FILE, report_entry.name) + ".xlsx"
    if os.path.exists(excel_name):
        print("文件存在" + excel_name)
    else:
        with open(excel_name, 'a+', encoding="utf-8") as f:
            print("创建文件成功" + excel_name)

        item_entry = report_entry.reportitem_set.all()

        for i in item_entry:
            url = i.protocol + "//" + i.url
            if i.result == 1:
                result = "通过"
            elif i.result == -1:
                result = "失败"
            else:
                result = "无检查点"

            data.append({"url": url, "params": i.params, "name": i.name, "method": i.method, "hope": i.hope,
                         "result": result, "sum_time": i.sum_time + "ms", "fact": i.fact})

        workbook = xlsxwriter.Workbook(excel_name, {"string_to_urls": False})
        worksheet = workbook.add_worksheet(report_entry.name)
        worksheet.write("A1", "用例名")
        worksheet.set_column("B:B", 60)
        worksheet.write("B1", "url")
        worksheet.write("C1", "请求方法")
        worksheet.write("D1", "入参")
        worksheet.write("E1", "期望结果")
        worksheet.write("F1", "实际结果")
        worksheet.set_column("F:F", 60)
        worksheet.write("G1", "是否通过")
        worksheet.write("H1", "耗时")
        temp = 2
        for j in data:
            worksheet.write("A" + str(temp), j["name"])
            worksheet.write("B" + str(temp), j["url"])
            worksheet.write("C" + str(temp), j["method"])
            worksheet.write("D" + str(temp), j["params"])
            worksheet.write("E" + str(temp), j["hope"])
            worksheet.write("F" + str(temp), j["fact"])
            worksheet.write("G" + str(temp), j["result"])
            worksheet.write("H" + str(temp), j["sum_time"])
            temp += 1
        workbook.close()

    file_name1 = os.path.join(settings.BASE_DIR, "myapi/Report", report_entry.name + ".xlsx")
    file = open(file_name1, 'rb')
    response = StreamingHttpResponse(file)
    response['Content-Type'] = 'application/octet-stream'
    response['Content-Disposition'] = 'attachment;filename="{}"'.format(report_entry.name)
    # file.close()

    return response


@check_login
def reports_detail(request, id):
    """
    测试报告详情
    id为report的id
    """
    # 得到测试总报告
    report = Report.objects.get(id=id)
    # 得到测试总报告下的测试详情
    report_items = report.reportitem_set.all()
    resp = []
    for i in report_items:
        url = i.protocol + "//" + i.url
        # 1通过，-1失败，-2不检查
        if i.result == 1:
            result = "通过"
        elif i.result == -1:
            result = "失败"
        else:
            result = "无检查点"
        params = i.params
        if params:
            params1 = ast.literal_eval(params)
        else:
            params1 = {}
        fact = i.fact
        if fact:
            fact1 = ast.literal_eval(fact)
        else:
            fact1 = {}

        app = {"url": url, "name": i.name, "method": i.method, "hope": i.hope, "fact": fact1,
               "result": result, "params": params1, "sum_time": i.sum_time}
        resp.append(app)
    data = {'code': 1, 'msg': 'success', "data": resp}
    return JsonResponse(data)


@check_login
def report_detail_del(request):
    """
    删除测试报告
    """
    data = json.loads(request.body)
    id = data.get("id")
    if not id:
        res = {'code': -1, 'msg': 'id must be fill'}
        return JsonResponse(res)
    try:
        report_entry = Report.objects.get(id=id)
        # 只能删除任务完成后的报告
        task_entry = Task.objects.get(id=report_entry.task_id)
        if task_entry.task_state == 2:
            report_entry.delete()
            file_name1 = os.path.join(settings.BASE_DIR, "myapi/Report", report_entry.name + ".xlsx")
            if os.path.exists(file_name1):
                os.remove(file_name1)
                print("删除测试报告=" + file_name1)
            res = {'code': 1, 'msg': 'success'}
        else:
            res = {'code': - 1, 'msg': 'task not finish,can not del'}
        return JsonResponse(res)
    except ObjectDoesNotExist:
        res = {'code': - 1, 'msg': 'id can not find a have effect data'}
        return JsonResponse(res)


@check_login
def get_all_suite(request):
    resp = []
    suites = Suite.objects.all()
    for i in suites:
        resp.append({"id": i.id, "name": i.name})
    return JsonResponse({"code": 1, "msg": "success", "data": resp})


@check_login
def get_suite_list(request):
    """
    带条件的套件列表
    """
    data = request.GET
    query = data.get("query")  # 查询条件
    page_num = data.get("pagenum")  # 当前页码
    page_size = data.get("pagesize")  # 每页显示多少条
    if query:
        suites = Suite.objects.filter(name__contains=query)

    else:
        suites = Suite.objects.all().order_by("-id")
    response = {}
    # 生成分页实例
    paginator = Paginator(suites, page_size)
    # 获取数据总条数
    response['total_count'] = paginator.count
    # 每页显示条数
    response['page_size'] = page_size
    # 总共页数
    response['total_page'] = paginator.num_pages
    response["list"] = []
    try:
        users = paginator.page(page_num)
    except PageNotAnInteger:
        users = paginator.page(1)
    except EmptyPage:
        users = paginator.page(paginator.num_pages)
    # 当前多少页
    response['pageNum'] = users.number
    # 获取数据
    for i in users.object_list:
        if i.is_fuzz:
            is_fuzz_ch = "是"
        else:
            is_fuzz_ch = "否"
        response["list"].append(
            {"name": i.name, "id": i.id, "is_fuzz": i.is_fuzz, "is_fuzz_ch": is_fuzz_ch}
        )
    res = {'code': 1, 'msg': '获取成功', 'data': response}
    # 将数据返回到页面
    return JsonResponse(res)


@check_login
def suite_add(request):
    data = json.loads(request.body)
    name = data.get("name")
    is_fuzz = data.get("is_fuzz", False)
    Suite(name=name, is_fuzz=is_fuzz).save()
    result = {'code': 1, 'msg': 'success'}
    return JsonResponse(result)


@check_login
def suite_edit(request):
    """
    编辑套件
    """
    data = json.loads(request.body)
    id = data.get("id")
    name = data.get("name")
    is_fuzz = data.get("is_fuzz", None)
    if not id or not name or is_fuzz is None:
        result = {'code': -1, 'msg': 'id,name,is_fuzz must be fill'}
        return JsonResponse(result)
    try:
        id = data.get("id")
        suite_entry = Suite.objects.get(id=id)
        if not suite_entry:
            result = {'code': -1, 'msg': 'no effect row'}
            return JsonResponse(result)
        suite_entry.is_fuzz = is_fuzz
        suite_entry.name = name
        suite_entry.save()
        return JsonResponse({'code': 1, 'msg': 'success'})
    except ObjectDoesNotExist:
        result = {'code': -1, 'msg': 'no effect row'}
        return JsonResponse(result)


@check_login
def suite_detail(request, id):
    """
    套件详情
    """
    try:
        suite_entry = Suite.objects.get(id=id)
        if not suite_entry:
            result = {'code': -1, 'msg': 'no effect row'}
            return JsonResponse(result)
        result = {'code': 1, 'msg': 'success', "data": {"name": suite_entry.name, "is_fuzz": suite_entry.is_fuzz}}
        return JsonResponse(result)

    except ObjectDoesNotExist:
        result = {'code': -1, 'msg': 'no effect row'}
        return JsonResponse(result)


@check_login
def suite_del(request):
    """
    删除套件
    """
    data = json.loads(request.body)
    id = data.get("id")
    if not id:
        result = {'code': -1, 'msg': 'id must be fill'}
        return JsonResponse(result)
    try:
        suite_entry = Suite.objects.get(id=id)
        if not suite_entry:
            result = {'code': -1, 'msg': 'id is no effect row'}
            return JsonResponse(result)
        else:
            suite_entry.delete()
            result = {'code': 1, 'msg': 'success'}
            return JsonResponse(result)
    except ObjectDoesNotExist:
        result = {'code': -1, 'msg': 'no effect row'}
        return JsonResponse(result)


@check_login
def suite_to_case_list(request, id):
    """
    添加关联的用例列表
    """
    suite_id = id
    try:
        suite_set_cases = SuiteSetCase.objects.filter(suite_id=suite_id)
        cases = Case.objects.all()
        if not cases:
            result = {'code': -1, 'msg': 'case data is null'}
            return JsonResponse(result)
        resp = []
        for i in suite_set_cases:
            for j in cases:
                # 对比关联的id数据,只有在用例库中存在才展示
                if j.id == i.case_id:
                    resp.append({"case_id": i.case_id})
        return JsonResponse({"code": 1, "msg": "success", "data": resp})

    except ObjectDoesNotExist:
        result = {'code': -1, 'msg': 'no effect row'}
        return JsonResponse(result)


@check_login
def suite_set_case(request):
    """
    套件关联用例
    """
    data = json.loads(request.body)
    suite_id = data.get("suite_id")
    case_ids = data.get("case_ids")  # [1,2,3,4]
    if not suite_id or not case_ids:
        result = {'code': -1, 'msg': 'suite_id and case_ids must be fill'}
        return JsonResponse(result)
    # 先删除当前关联的用例逻辑
    suite_set_cases = SuiteSetCase.objects.all()
    # suite_set_cases = SuiteSetCase.filter(suite_id=suite_id)
    for i in suite_set_cases:
        if i.suite_id == suite_id:
            try:
                entrys = SuiteSetCase.objects.filter(suite_id=suite_id)
                for j in entrys:
                    j.delete()
            except ObjectDoesNotExist:
                pass
    for i in case_ids:
        SuiteSetCase(suite_id=suite_id, case_id=i).save()

    result = {'code': 1, 'msg': 'success'}
    return JsonResponse(result)


@check_login
def get_case_all_list(request):
    """
    所有用例列表
    """
    cases = Case.objects.all().order_by("-id")
    resp = []
    for i in cases:
        resp.append({"id": i.id, "name": i.name})
    return JsonResponse({"code": 1, "msg": "success", "data": resp})


@check_login
def get_case_list(request):
    """
    带分页和搜索的用例列表
    """
    data = request.GET
    query = data.get("query")  # 查询条件
    page_num = data.get("pagenum")  # 当前页码
    page_size = data.get("pagesize")  # 每页显示多少条
    if query:
        cases = Case.objects.filter(name__contains=query)

    else:
        cases = Case.objects.all().order_by("-id")
    response = {}
    # 生成分页实例
    paginator = Paginator(cases, page_size)
    # 获取数据总条数
    response['total_count'] = paginator.count
    # 每页显示条数
    response['page_size'] = page_size
    # 总共页数
    response['total_page'] = paginator.num_pages
    response["list"] = []
    try:
        users = paginator.page(page_num)
    except PageNotAnInteger:
        users = paginator.page(1)
    except EmptyPage:
        users = paginator.page(paginator.num_pages)
    # 当前多少页
    response['pageNum'] = users.number
    # 获取数据
    for i in users.object_list:
        url = i.protocol + "://" + i.url
        response["list"].append(
            {"name": i.name, "url": url, "id": i.id,
             "method": i.method, "params": i.params, "hope": i.hope}
        )
    res = {'code': 1, 'msg': '获取成功', 'data': response}
    # 将数据返回到页面
    return JsonResponse(res)


@check_login
def case_add(request):
    """
    新增用例
    """
    data = json.loads(request.body)
    name = data.get("name")
    url = data.get("url")
    protocol = data.get("protocol")
    method = data.get("method")
    params = data.get("params")
    hope = data.get("hope")
    if not name or not url or not protocol or not protocol or not method or not hope:
        res = {'code': -1, 'msg': 'name,url,hope,method,protocol must be fill'}
        return JsonResponse(res)
    Case(name=name, url=url, protocol=protocol, params=params, method=method, hope=hope).save()
    res = {'code': 1, 'msg': 'success'}
    return JsonResponse(res)


@check_login
def case_detail(request, id):
    """
    用例详情
    """
    try:
        case_entry = Case.objects.get(id=id)
        resp = {"name": case_entry.name, "url": case_entry.url, "protocol": case_entry.protocol,
                "method": case_entry.method, "params": case_entry.params, "hope": case_entry.hope}
        res = {'code': 1, 'msg': 'success', "data": resp}
        return JsonResponse(res)
    except ObjectDoesNotExist:
        res = {'code': - 1, 'msg': 'id is no effect row'}
        return JsonResponse(res)


@check_login
def case_edit(request):
    """
    用例编辑
    """
    data = json.loads(request.body)
    id = data.get("id")
    name = data.get("name")
    url = data.get("url")
    protocol = data.get("protocol")
    method = data.get("method")
    hope = data.get("hope")
    params = data.get("params")
    if not id or not name or not url or not protocol or not protocol or not method or not hope:
        res = {'code': -1, 'msg': 'id,name,url,hope,method,protocol must be fill'}
        return JsonResponse(res)
    try:
        case_entry = Case.objects.get(id=id)
        case_entry.name = name
        case_entry.url = url
        case_entry.params = params
        case_entry.hope = hope
        case_entry.protocol = protocol
        case_entry.method = method
        case_entry.save()
        res = {'code': 1, 'msg': 'success'}
        return JsonResponse(res)

    except ObjectDoesNotExist:
        res = {'code': - 1, 'msg': 'id can not find a have effect data'}
        return JsonResponse(res)


@check_login
def case_del(request):
    """
    用例删除
    """
    data = json.loads(request.body)
    id = data.get("id")
    if not id:
        res = {'code': -1, 'msg': 'id must be fill'}
        return JsonResponse(res)
    try:
        case_entry = Case.objects.get(id=id)
        case_entry.delete()
        res = {'code': 1, 'msg': 'success'}
        return JsonResponse(res)
    except ObjectDoesNotExist:
        res = {'code': - 1, 'msg': 'id can not find a have effect data'}
        return JsonResponse(res)


@check_login
def get_fuzz_list(request):
    """
    模糊用例规则
    """
    data = request.GET
    query = data.get("query")  # 查询条件
    page_num = data.get("pagenum")  # 当前页码
    page_size = data.get("pagesize")  # 每页显示多少条
    if query:
        fuzzs = Fuzz.objects.filter(name__contains=query)

    else:
        fuzzs = Fuzz.objects.all().order_by("-id")
    response = {}
    # 生成分页实例
    paginator = Paginator(fuzzs, page_size)
    # 获取数据总条数
    response['total_count'] = paginator.count
    # 每页显示条数
    response['page_size'] = page_size
    # 总共页数
    response['total_page'] = paginator.num_pages
    response["list"] = []
    try:
        users = paginator.page(page_num)
    except PageNotAnInteger:
        users = paginator.page(1)
    except EmptyPage:
        users = paginator.page(paginator.num_pages)
    # 当前多少页
    response['pageNum'] = users.number
    # 获取数据
    for i in users.object_list:
        response["list"].append(
            {"name": i.name, "fuzz_type": i.fuzz_type, "id": i.id, "content": i.fuzz_content}
        )
    res = {'code': 1, 'msg': '获取成功', 'data': response}
    # 将数据返回到页面
    return JsonResponse(res)


@check_login
def fuzz_add(request):
    """
    新增模糊用例规则
    """
    data = json.loads(request.body)
    name = data.get("name")
    fuzz_type = data.get("fuzz_type")
    fuzz_content = data.get("content")
    if fuzz_type == -3 and fuzz_content is None:
        res = {'code': -1, 'msg': 'fuzz_content must be fill'}
        return JsonResponse(res)
    if not name or not fuzz_type:
        res = {'code': -1, 'msg': 'name,fuzz_type must be fill'}
        return JsonResponse(res)
    Fuzz(name=name, fuzz_type=fuzz_type, fuzz_content=fuzz_content).save()
    res = {'code': 1, 'msg': 'success'}
    return JsonResponse(res)


@check_login
def fuzz_detail(request, id):
    """
    模糊用例详情
    """
    try:
        fuzz_entry = Fuzz.objects.get(id=id)
        resp = {"name": fuzz_entry.name, "fuzz_type": fuzz_entry.fuzz_type, "content": fuzz_entry.fuzz_content}
        res = {'code': 1, 'msg': 'success', "data": resp}
        return JsonResponse(res)
    except ObjectDoesNotExist:
        res = {'code': - 1, 'msg': 'id is no effect row'}
        return JsonResponse(res)


@check_login
def fuzz_edit(request):
    """
    用例编辑
    """
    data = json.loads(request.body)
    id = data.get("id")
    name = data.get("name")
    fuzz_type = data.get("fuzz_type")
    fuzz_content = data.get("content")
    if fuzz_type != -3:
        res = {'code': -1, 'msg': 'fuzz_type is error,must is -3'}
        return JsonResponse(res)

    if not name or not fuzz_content or not fuzz_type:
        res = {'code': -1, 'msg': 'content,fuzz_type,name must be fill'}
        return JsonResponse(res)
    try:
        fuzz_entry = Fuzz.objects.get(id=id)
        fuzz_entry.name = name
        fuzz_entry.fuzz_type = fuzz_type
        fuzz_entry.fuzz_content = fuzz_content
        fuzz_entry.save()
        res = {'code': 1, 'msg': 'success'}
        return JsonResponse(res)

    except ObjectDoesNotExist:
        res = {'code': - 1, 'msg': 'id can not find a have effect data'}
        return JsonResponse(res)


@check_login
def fuzz_del(request):
    """
    用例删除
    """
    data = json.loads(request.body)
    id = data.get("id")
    if not id:
        res = {'code': -1, 'msg': 'id must be fill'}
        return JsonResponse(res)
    try:
        case_entry = Fuzz.objects.get(id=id)
        if case_entry.fuzz_type in [0, -1, -2]:
            res = {'code': -1, 'msg': 'default fuzz rule cannot del'}
            return JsonResponse(res)
        case_entry.delete()
        res = {'code': 1, 'msg': 'success'}
        return JsonResponse(res)
    except ObjectDoesNotExist:
        res = {'code': - 1, 'msg': 'id can not find a have effect data'}
        return JsonResponse(res)


@check_login
def get_real_time_task_list(request):
    """
    实时任务列表
    """
    data = request.GET
    query = data.get("query")  # 查询条件
    page_num = data.get("pagenum")  # 当前页码
    page_size = data.get("pagesize")  # 每页显示多少条
    task_type = 1
    if query:
        cases = Task.objects.filter(name__contains=query, task_type=task_type)

    else:
        cases = Task.objects.filter(task_type=task_type).order_by("-id")
    response = {}
    # 生成分页实例
    paginator = Paginator(cases, page_size)
    # 获取数据总条数
    response['total_count'] = paginator.count
    # 每页显示条数
    response['page_size'] = page_size
    # 总共页数
    response['total_page'] = paginator.num_pages
    response["list"] = []
    try:
        users = paginator.page(page_num)
    except PageNotAnInteger:
        users = paginator.page(1)
    except EmptyPage:
        users = paginator.page(paginator.num_pages)
    # 当前多少页
    response['pageNum'] = users.number
    # 获取数据
    for i in users.object_list:
        if i.task_state == 1:
            task_state_name = "测试中"
        elif i.task_state == 2:
            task_state_name = "测试完成"
        else:
            task_state_name = "未开始"
        try:
            suite_name = Suite.objects.get(id=i.suite_id).name
        except:
            suite_name = "没有值"
        try:
            # 得到测试总报告,获取用例数量统计，如果出现异常，可能是报告这里被删除了
            report = Report.objects.get(task_id=i.id)
            passed = report.passed
            failed = report.failed
        except:
            passed = 0
            failed = 0

        response["list"].append(
            {"name": i.name, "id": i.id, "task_state_name": task_state_name, "sum_time": i.sum_time,
             "task_state": i.task_state, "suite_name": suite_name, "passed": passed, "failed": failed}
        )
    res = {'code': 1, 'msg': '获取成功', 'data': response}
    # 将数据返回到页面
    return JsonResponse(res)


@check_login
def get_timing_task_list(request):
    """
    获取定时任务列表
    """
    data = request.GET
    query = data.get("query")  # 查询条件
    page_num = data.get("pagenum")  # 当前页码
    page_size = data.get("pagesize")  # 每页显示多少条
    task_type = 2
    if query:
        cases = Task.objects.filter(name__contains=query, task_type=task_type)

    else:
        cases = Task.objects.filter(task_type=task_type).order_by("-id")
    response = {}
    # 生成分页实例
    paginator = Paginator(cases, page_size)
    # 获取数据总条数
    response['total_count'] = paginator.count
    # 每页显示条数
    response['page_size'] = page_size
    # 总共页数
    response['total_page'] = paginator.num_pages
    response["list"] = []
    try:
        users = paginator.page(page_num)
    except PageNotAnInteger:
        users = paginator.page(1)
    except EmptyPage:
        users = paginator.page(paginator.num_pages)
    # 当前多少页
    response['pageNum'] = users.number
    # 获取数据
    for i in users.object_list:
        if i.task_state == 1:
            task_state_name = "测试中"
        elif i.task_state == 2:
            task_state_name = "测试完成"
        else:
            task_state_name = "未开始"
        try:
            suite_name = Suite.objects.get(id=i.suite_id).name
        except:
            suite_name = "没有值"

        try:
            # 得到测试总报告,获取用例数量统计，如果出现异常，可能是报告这里被删除了
            report = Report.objects.get(task_id=i.id)
            passed = report.passed
            failed = report.failed
        except:
            passed = 0
            failed = 0

        response["list"].append(
            {"name": i.name, "id": i.id, "task_state_name": task_state_name, "sum_time": i.sum_time, "passed": passed,
             "task_state": i.task_state, "suite_name": suite_name, "start_time": i.start_time, "failed": failed}
        )
    res = {'code': 1, 'msg': '获取成功', 'data': response}
    # 将数据返回到页面
    return JsonResponse(res)


@check_login
def new_timing_task(request):
    """
    新建定时任务
    """
    scheduler = BackgroundScheduler()
    scheduler.add_jobstore(DjangoJobStore(), 'default')

    data = json.loads(request.body)
    name = data.get("name")
    task_state = 0
    task_type = 2
    suite_id = data.get("suite_id")
    start_time1 = data.get("start_time")  # 用户输入的任务开始时间, '10:00:00'
    start_time = start_time1.split(':')
    hour = int(start_time[0])
    minute = int(start_time[1])
    # 最终替换这种格式,在生成文件（11:12:13）这种报错
    start_time1 = start_time1.replace(":", "-")
    ta = Task(name=name + "定时任务" + start_time1, task_type=task_type, task_state=task_state, suite_id=suite_id,
              start_time=start_time1)
    ta.save()
    scheduler.add_job(background_task, 'cron', hour=hour, minute=minute,
                      kwargs={"suite_id": suite_id, "task": ta}, id=str(ta.id))

    scheduler.start()
    res = {'code': 1, 'msg': 'success'}
    return JsonResponse(res)


@check_login
def timing_task_del(request):
    """
    删除定时任务
    """
    data = json.loads(request.body)
    id = data.get("id")
    if not id:
        res = {'code': -1, 'msg': 'id must be fill'}
        return JsonResponse(res)
    try:
        task_entry = Task.objects.get(id=id)
        if task_entry.task_state in [0, 2]:
            DjangoJob.objects.filter(id=str(id)).delete()
            task_entry.delete()
            res = {'code': 1, 'msg': 'success'}
        else:
            res = {'code': - 1, 'msg': 'task not finish,can not del'}
        return JsonResponse(res)
    except ObjectDoesNotExist:
        res = {'code': - 1, 'msg': 'id can not find a have effect data'}
        return JsonResponse(res)


@check_login
def new_real_time_task(request):
    """
    新建实时任务
    """
    data = json.loads(request.body)
    name = data.get("name")
    task_state = 0
    task_type = 1
    suite_id = data.get("suite_id")
    start_time = datetime.now().strftime("%H-%M-%S")
    ta = Task(name=name + "实时任务" + start_time, task_type=task_type, task_state=task_state, suite_id=suite_id,
              start_time=start_time)
    ta.save()
    res = {'code': 1, 'msg': 'success'}
    threading.Thread(target=background_task, args=(), kwargs={"suite_id": suite_id, "task": ta}).start()
    # background_task(suite_id, ta)
    return JsonResponse(res)


def background_task(suite_id, task):
    """
    suite_id: 套件id
    task: 任务实体类
    task_entry: 任务实体
    """
    task_id = task.id
    # 更新任务为测试中
    task.task_state = 1
    task.save()
    # 得到套件
    su = Suite.objects.get(id=suite_id)
    # 是否开启fuzz测试
    is_fuzz = su.is_fuzz
    # 得到套件下关联的用例
    ss = su.suitesetcase_set.all()
    start_time = task.start_time
    # 新建一个测试报告
    _report = Report(name=task.name, start_time=start_time, task_id=task_id)
    _report.save()
    # 成功,失败例总数
    passed = 0
    failed = 0
    if not ss:
        print("==没有可用用例==")
    for i in ss:
        time.sleep(2)
        case_id = i.case_id
        case_entry = Case.objects.get(pk=case_id)
        bac = ApiTask.exec_case_background(case_entry, _report, is_fuzz)
        passed = passed + bac["passed"]
        failed = failed + bac["failed"]

        pass
    time.sleep(2)

    end_time = datetime.now().strftime("%H-%M-%S")
    # 以小时，分钟，秒钟的方式记录所有用例耗时时间
    total_time = ApiTask.get_case_total_time(start_time, end_time)
    # 再次编辑测试报告
    _report.sum_time = total_time
    _report.passed = passed
    _report.failed = failed
    _report.save()

    task_sum_time = ApiTask.get_case_total_time(task.start_time, end_time)
    # 回写任务已经完成
    task.task_state = 2
    task.sum_time = task_sum_time
    task.save()


@check_login
def real_time_task_detail(request, id):
    """
    实时任务详情
    id为task得id
    """
    # 得到测试总报告
    report = Report.objects.get(task_id=id)
    # 得到测试总报告下的测试详情
    report_items = report.reportitem_set.all()
    resp = []
    for i in report_items:
        url = i.protocol + "//" + i.url
        # 1通过，-1失败，-2不检查
        if i.result == 1:
            result = "通过"
        elif i.result == -1:
            result = "失败"
        else:
            result = "无检查点"
        params = i.params
        if params:
            params1 = ast.literal_eval(params)
        else:
            params1 = {}
        fact = i.fact
        if fact:
            fact1 = ast.literal_eval(fact)
        else:
            fact1 = {}

        app = {"url": url, "name": i.name, "method": i.method, "hope": i.hope, "fact": fact1,
               "result": result, "params": params1, "sum_time": i.sum_time}
        resp.append(app)
    data = {'code': 1, 'msg': 'success', "data": resp}
    return JsonResponse(data)


@check_login
def real_time_task_del(request):
    """
    删除实时任务
    """
    data = json.loads(request.body)
    id = data.get("id")
    if not id:
        res = {'code': -1, 'msg': 'id must be fill'}
        return JsonResponse(res)
    try:
        task_entry = Task.objects.get(id=id)
        if task_entry.task_state == 2:
            task_entry.delete()
            res = {'code': 1, 'msg': 'success'}
        else:
            res = {'code': - 1, 'msg': 'task not finish,can not del'}
        return JsonResponse(res)
    except ObjectDoesNotExist:
        res = {'code': - 1, 'msg': 'id can not find a have effect data'}
        return JsonResponse(res)


# @check_login
def get_shop_list(request):
    """
    商品列表接口
    """
    res = {"code": 1, "msg": "success", "data": []}
    for i in range(10):
        app = {"id": i, "name": "手机" + str(i), "price": 100 + i}
        res["data"].append(app)

    return JsonResponse(res)


# @check_login
def shop_detail(request, id):
    """
    商品详情接口
    """
    if id > 1:

        res = {"code": 1, "msg": "success", "data": {"price": 100, "store": 100}}
    else:
        res = {"code": -1, "msg": "this shop is not exists", "data": {}}
    return JsonResponse(res)


# @check_login
def shop_add(request):
    """
    新增商品
    """

    data = json.loads(request.body)
    name = data.get("name")  # 商品名字
    price = data.get("price")  # 商品价格
    address = data.get("address")  # 商品地址
    if not name and not price and not address:
        res = {"code": -1, "msg": "name,price,address is must be fill"}
        return JsonResponse(res)
    else:
        res = {"code": 1, "msg": "success"}
        return JsonResponse(res)
