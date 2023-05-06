import json

import requests
from django.core.exceptions import ObjectDoesNotExist
from django.http import JsonResponse

from myapi.models import ApiLogin


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
