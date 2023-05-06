import json

from apscheduler.schedulers.background import BackgroundScheduler
from django.core.exceptions import ObjectDoesNotExist
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from django.http import JsonResponse
from django_apscheduler.jobstores import DjangoJobStore
from django_apscheduler.models import DjangoJob

from myapi.models import Task, Suite, Report
from myapi.base.task import ApiTask


def get_timing_task_list(request):
    """
    获取定时任务列表
    """
    data = request.GET
    query = data.get("query")  # 查询条件
    page_num = data.get("pagenum")  # 当前页码
    page_size = data.get("pagesize")  # 每页显示多少条
    task_type = 2
    if query:
        cases = Task.objects.filter(name__contains=query, task_type=task_type)

    else:
        cases = Task.objects.filter(task_type=task_type).order_by("-id")
    response = {}
    # 生成分页实例
    paginator = Paginator(cases, page_size)
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
        if i.task_state == 1:
            task_state_name = "测试中"
        elif i.task_state == 2:
            task_state_name = "测试完成"
        else:
            task_state_name = "未开始"
        try:
            suite_name = Suite.objects.get(id=i.suite_id).name
        except:
            suite_name = "没有值"

        try:
            # 得到测试总报告,获取用例数量统计，如果出现异常，可能是报告这里被删除了
            report = Report.objects.get(task_id=i.id)
            passed = report.passed
            failed = report.failed
        except:
            passed = 0
            failed = 0

        response["list"].append(
            {"name": i.name, "id": i.id, "task_state_name": task_state_name, "sum_time": i.sum_time, "passed": passed,
             "task_state": i.task_state, "suite_name": suite_name, "start_time": i.start_time, "failed": failed}
        )
    res = {'code': 1, 'msg': '获取成功', 'data': response}
    # 将数据返回到页面
    return JsonResponse(res)


def new_timing_task(request):
    """
    新建定时任务
    """
    scheduler = BackgroundScheduler()
    scheduler.add_jobstore(DjangoJobStore(), 'default')

    data = json.loads(request.body)
    name = data.get("name")
    task_state = 0
    task_type = 2
    suite_id = data.get("suite_id")
    start_time1 = data.get("start_time")  # 用户输入的任务开始时间, '10:00:00'
    start_time = start_time1.split(':')
    hour = int(start_time[0])
    minute = int(start_time[1])
    # 最终替换这种格式,在生成文件（11:12:13）这种报错
    start_time1 = start_time1.replace(":", "-")
    ta = Task(name=name + "定时任务" + start_time1, task_type=task_type, task_state=task_state, suite_id=suite_id,
              start_time=start_time1)
    ta.save()
    scheduler.add_job(ApiTask.background_task, 'cron', hour=hour, minute=minute,
                      kwargs={"suite_id": suite_id, "task": ta}, id=str(ta.id))

    scheduler.start()
    res = {'code': 1, 'msg': 'success'}
    return JsonResponse(res)


def timing_task_del(request):
    """
    删除定时任务
    """
    data = json.loads(request.body)
    id = data.get("id")
    if not id:
        res = {'code': -1, 'msg': 'id must be fill'}
        return JsonResponse(res)
    try:
        task_entry = Task.objects.get(id=id)
        if task_entry.task_state in [0, 2]:
            DjangoJob.objects.filter(id=str(id)).delete()
            task_entry.delete()
            res = {'code': 1, 'msg': 'success'}
        else:
            res = {'code': - 1, 'msg': 'task not finish,can not del'}
        return JsonResponse(res)
    except ObjectDoesNotExist:
        res = {'code': - 1, 'msg': 'id can not find a have effect data'}
        return JsonResponse(res)
