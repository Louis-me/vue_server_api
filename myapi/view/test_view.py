"""
测试接口信息
"""
import json

from django.http import JsonResponse


def get_shop_list(request):
    """
    商品列表接口
    """
    res = {"code": 1, "msg": "success", "data": []}
    for i in range(10):
        app = {"id": i, "name": "手机" + str(i), "price": 100 + i}
        res["data"].append(app)

    return JsonResponse(res)


def shop_detail(request, id):
    """
    商品详情接口
    """
    if id > 1:

        res = {"code": 1, "msg": "success", "data": {"price": 100, "store": 100}}
    else:
        res = {"code": -1, "msg": "this shop is not exists", "data": {}}
    return JsonResponse(res)


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
