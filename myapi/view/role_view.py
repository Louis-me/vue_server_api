from django.http import JsonResponse

from myapi.models import Role


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