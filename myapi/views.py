from django.http import JsonResponse
from django.shortcuts import render, redirect
from django.views.decorators.csrf import csrf_exempt

from myapi import models


def check_login(func):  # 自定义登录验证装饰器
    def warpper(request, *args, **kwargs):
        is_login = request.session.get('is_login', False)
        if is_login:
            return func(request, *args, **kwargs)
        else:
            # return redirect("/login")
            return JsonResponse({'code': -1, 'msg': 'not login'})

    return warpper


@check_login
def index(request):
    # return render(request, 'login/index.html')
    return JsonResponse({'code': 2, 'msg': 'this is index message'})


@csrf_exempt
def login(request):
    if request.session.get('is_login', None):
        return {'code': 1, 'msg': 'already success'}
    user_name = request.POST.get("user_name")
    pwd = request.POST.get("pwd")
    user = models.User.objects.get(name=user_name)
    if user and user.password == pwd:
        result = {'code': 1, 'msg': 'login is success'}
        request.session['is_login'] = True
        request.session['user_id'] = user.id
        request.session['user_name'] = user.name
    else:
        result = {'code': -1, 'msg': 'check user and pwd'}

    return JsonResponse(result)


def loginout(request):
    if not request.session.get('is_login', None):
        # 若是原本就未登陆，也就没有登出一说
        # return redirect("/index/")
        return JsonResponse({"code": -1, "msg": "you are not login"})

    request.session.flush()
    # 或者使用下面的方法
    # del request.session['is_login']
    # del request.session['user_id']
    # del request.session['user_name']
    # return redirect("/index/")
    return JsonResponse({"code": 1, "msg": "login out is success"})
