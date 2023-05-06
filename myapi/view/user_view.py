import json

from django.core.exceptions import ObjectDoesNotExist
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from django.http import JsonResponse

from myapi.models import User, Role


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
