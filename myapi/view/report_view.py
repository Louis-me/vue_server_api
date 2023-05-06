import ast
import json
import os

import xlsxwriter
from django.core.exceptions import ObjectDoesNotExist
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from django.http import JsonResponse, StreamingHttpResponse

from myapi.base.element import Element
from myapi.models import Suite, SuiteSetCase, ReportItem, Report, Task
from mysite import settings


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

    file_name1 = os.path.join(settings.BASE_DIR, "myapi/Report", name + ".xlsx")
    file = open(file_name1, 'rb')
    response = StreamingHttpResponse(file)
    response['Content-Type'] = 'application/octet-stream'
    response['Content-Disposition'] = 'attachment;filename="{}"'.format(name)
    # file.close()

    return response


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
        # 报告关联任务详情的数据
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