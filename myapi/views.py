import json

from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from django.http import JsonResponse
import uuid
from django.core.exceptions import ObjectDoesNotExist
from myapi.models import *
import requests
import json


def check_login(func):  # 自定义登录验证装饰器
    def warpper(request, *args, **kwargs):
        token = request.META.get("HTTP_AUTHORIZATION")
        print("check_login")
        print(token)
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
        return JsonResponse({"code": 1, "msg": "login out is fail"})


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
def get_suite_list(request):
    """
    套件列表
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
            {"name": i.name,"id": i.id, "is_fuzz": i.is_fuzz, "is_fuzz_ch": is_fuzz_ch}
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
    for i in suite_set_cases:
        if i.suite_id == suite_id:
            try:
                entry = SuiteSetCase.objects.get(suite_id=suite_id)
                if entry:
                    entry.delete()
            except ObjectDoesNotExist:
                pass
    for i in case_ids:
        SuiteSetCase(suite_id=suite_id, case_id=i).save()

    result = {'code': 0, 'msg': 'success'}
    return JsonResponse(result)


@check_login
def get_case_list(request):
    """
    用例列表
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
        response["list"].append(
            {"name": i.name, "url": i.url, "id": i.id, "protocol": i.protocol,
             "method": i.method, "params": i.params, "hope": i.hope, "suite_id": i.suite_id}
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
    if not id or not name or not url or not protocol or not protocol or not method  or not hope:
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
            {"name": i.name, "fuzz_type": i.fuzz_type, "id": i.id, "fuzz_content": i.fuzz_content}
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
    fuzz_content = data.get("fuzz_content")
    if fuzz_type == 3 and fuzz_content is None:
        res = {'code': -1, 'msg': 'fuzz_content must be fill'}
        return JsonResponse(res)
    if not name or not fuzz_type:
        res = {'code': -1, 'msg': 'name,fuzz_type must be fill'}
        return JsonResponse(res)
    Case(name=name, fuzz_type=fuzz_type, fuzz_content=fuzz_content).save()
    res = {'code': 1, 'msg': 'success'}
    return JsonResponse(res)


@check_login
def fuzz_detail(request, id):
    """
    模糊用例详情
    """
    try:
        fuzz_entry = Fuzz.objects.get(id=id)
        resp = {"name": fuzz_entry.name, "fuzz_type": fuzz_entry.fuzz_type, "fuzz_content": fuzz_entry.fuzz_content}
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
    fuzz_content = data.get("fuzz_content")
    if fuzz_type == 3 and fuzz_content is None:
        res = {'code': -1, 'msg': 'fuzz_content must be fill'}
        return JsonResponse(res)
    if not name or not fuzz_type:
        res = {'code': -1, 'msg': 'name,fuzz_type must be fill'}
        return JsonResponse(res)
    try:
        case_entry = Case.objects.get(id=id)
        case_entry.name = name
        case_entry.fuzz_type = fuzz_type
        case_entry.fuzz_content = fuzz_content
        case_entry.save()
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
        if case_entry.fuzz_type in [0, 1, 2]:
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
    pass


@check_login
def get_timing_task_list(request):
    """
    获取定时任务列表
    """
    pass


@check_login
def timing_task_del(request):
    """
    删除定时任务
    """


@check_login
def new_real_time_task(request):
    """
    新建实时任务
    """
    pass


@check_login
def real_time_task_del(request):
    """
    删除实时任务
    """
