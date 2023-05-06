import json

from django.core.exceptions import ObjectDoesNotExist
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from django.http import JsonResponse

from myapi.models import Suite, SuiteSetCase, Case


def get_all_suite(request):
    resp = []
    suites = Suite.objects.all()
    for i in suites:
        resp.append({"id": i.id, "name": i.name})
    return JsonResponse({"code": 1, "msg": "success", "data": resp})


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


def suite_add(request):
    data = json.loads(request.body)
    name = data.get("name")
    is_fuzz = data.get("is_fuzz", False)
    Suite(name=name, is_fuzz=is_fuzz).save()
    result = {'code': 1, 'msg': 'success'}
    return JsonResponse(result)


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
