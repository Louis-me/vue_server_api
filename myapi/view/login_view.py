# -*- coding: UTF-8 -*-
from django.http import JsonResponse
import uuid
from django.core.exceptions import ObjectDoesNotExist
from myapi.models import *
import json



def login(request):
    """
    登陆
    """
    req_token = request.META.get("HTTP_AUTHORIZATION")
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