import json

from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from django.http import JsonResponse
# from django.shortcuts import render, redirect
# from django.views.decorators.csrf import csrf_exempt
import uuid
from myapi import models
from django.core.exceptions import ObjectDoesNotExist
# from myapi.models import User
# from django.core import serializers
from myapi.models import Role


def check_login(func):  # 自定义登录验证装饰器
    def warpper(request, *args, **kwargs):
        token = request.META.get("HTTP_AUTHORIZATION")
        # 得到token实体类
        try:
            token_entry = models.Token.objects.get(name=token)
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
    return JsonResponse({'code': 2, 'msg': 'this is index message'})


# @csrf_exempt
def login(request):
    req_token = request.META.get("HTTP_AUTHORIZATION")
    data = json.loads(request.body)
    user_name = data.get('username')
    pwd = data.get("pwd")
    if not user_name or not pwd:
        return JsonResponse({"code": -1, "msg": "username and pwd must fill in"})

    try:
        user = models.User.objects.get(name=user_name)
        if not user:
            return JsonResponse({'code': -1, 'msg': 'login is fail'})

        # 得到token实体类
        token_entry = None
        try:
            token_entry = models.Token.objects.get(name=req_token)
        except ObjectDoesNotExist:
            pass

        # 如果查到有token就是已经登陆了
        if token_entry:
            return {'code': -1, 'msg': 'already success'}
        if user.password != pwd:
            return JsonResponse({'code': -1, 'msg': 'login is fail'})
        # 登陆成功后写token
        if user.password == pwd:
            token = str(uuid.uuid1())
            # 如果token存在就修改
            try:
                token_entry = models.Token.objects.get(user_id=user.id)
            except ObjectDoesNotExist:
                token_entry = None

            if token_entry:
                token_entry.name = token
                token_entry.save()
            else:
                # user.token_set.create(name=token)
                models.Token(name=token, user=user).save()
            result = {'code': 1, 'msg': 'login is success', 'token': token}
            return JsonResponse(result)

    except ObjectDoesNotExist:
        result = {'code': -2, 'msg': 'check user or pwd'}
        return JsonResponse(result)


def loginout(request):
    req_token = request.META.get("HTTP_AUTHORIZATION")
    try:
        token_entry = models.Token.objects.get(name=req_token)
        if token_entry:
            token_entry.delete()
            return JsonResponse({"code": 1, "msg": "login out is success"})
        else:
            return JsonResponse({"code": - 1, "msg": "login out is fail"})
    except ObjectDoesNotExist:
        return JsonResponse({"code": 1, "msg": "login out is fail"})


# @check_login
def get_role_list(request):
    res = models.Role.objects.all()
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
    try:
        user_entry = models.User.objects.get(id=id)
        role_entry = models.Role.objects.get(id=user_entry.role_id)
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
    data = json.loads(request.body)
    print(data)
    id = data.get("id")
    if not id:
        return JsonResponse({"code": -1, "msg": "id must be fill"})
    try:
        user_entry = models.User.objects.get(id=id)
        if not user_entry:
            return JsonResponse({"code": -1, "msg": "no effect row"})
        user_entry.delete()
        return JsonResponse({"code": 1, "msg": "success"})

    except ObjectDoesNotExist:
        return JsonResponse({"code": -1, "msg": "no effect row"})

@check_login
def user_edit(request):
    data = json.loads(request.body)
    user_name = data.get('username').strip()
    pwd = data.get("pwd").strip()
    role_id = data.get("roleId")
    ids = data.get("id")
    if not user_name and not pwd and not role_id:
        return JsonResponse({"code": -1, "msg": "username,pwd,role must be fill"})
    try:
        user_entry = models.User.objects.get(id=ids)
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
    data = json.loads(request.body)
    user_name = data.get('username').strip()
    pwd = data.get("pwd").strip()
    role_id = data.get("roleId")
    if not user_name and not pwd and not role_id:
        return JsonResponse({"code": -1, "msg": "username,pwd,role must be fill"})
    try:
        check_user_name = models.User.objects.get(name=user_name)
        if check_user_name:
            return JsonResponse({"code": -1, "msg": "username is exists"})
    except ObjectDoesNotExist:
        pass
    models.User(name=user_name, password=pwd, role_id=role_id).save()
    return JsonResponse({"code": 1, "msg": "success"})


@check_login
def get_user_list(request):
    data = request.GET
    query = data.get("query")
    page_num = data.get("pagenum")
    page_size = data.get("pagesize")
    # users = models.User.objects.exclude(role_id=1)
    # users = models.User.objects.filter(type__name__contains='python')
    if query:
        users = models.User.objects.filter(name__contains=query)

    else:
        users = models.User.objects.all().order_by("-c_time")
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
        role = models.Role.objects.get(id=i.role_id)
        if role.name == "comm":
            role_name = "普通用户"
        else:
            role_name = "超级用户"
        response["list"].append({"name": i.name, "role_name": role_name, "id": i.id})
    res = {'code': 1, 'message': '获取成功', 'data': response}
    # 将数据返回到页面
    return JsonResponse(res)
