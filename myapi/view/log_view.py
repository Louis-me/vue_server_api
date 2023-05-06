import json
import os

from django.http import JsonResponse


def logs(request):
    # dir_file = "d:\log"
    dir_file = "/home/api_log/log"
    files_list = []
    for root, dirs, files in os.walk(dir_file, topdown=False):
        for name in files:
            app = {"label": os.path.join(name)}
            files_list.append(app)

    res = {"code": 1, "msg": "success", "data": {"root": dir_file, "files": files_list}}
    return JsonResponse(res)



def log_content(request):
    import subprocess
    data = json.loads(request.body)
    name = data.get("name")  # 文件名称
    root = data.get("root")  # 文件主目录
    dir_file = "/home/api_log/log"
    # dir_file = "d:\log"
    if root != dir_file:
        return JsonResponse({"code": -1, "msg": "root dir is wrong!"})
    if not os.path.exists(os.path.join(root, name)):
        return JsonResponse({"code": -1, "msg": "file is not exists!"})

    # 每次获取最新的50条数据
    fh = subprocess.Popen("tail -n 50 %s" % (os.path.join(root, name)), stdout=subprocess.PIPE, shell=True)
    # fh = subprocess.Popen("dir", stdout=subprocess.PIPE, shell=True)
    tmp_contents = fh.stdout.readlines()
    try:
        contents = [i.decode("utf-8") for i in tmp_contents]
    except Exception as e:
        contents = [i.decode("gb2312") for i in tmp_contents]
    return JsonResponse({"code": 1, "msg": "success", "data": {"content": contents}})