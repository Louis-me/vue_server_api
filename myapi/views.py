# -*- coding: UTF-8 -*-
from django.core.exceptions import ObjectDoesNotExist
from django.http import JsonResponse

from .models import Token
from .view import login_view, role_view, user_view, api_login_view, \
    report_view, suite_view, case_view, fuzz_view, timing_task_view, \
    real_time_task_view, test_view, log_view


def check_login(func):  # 自定义登录验证装饰器
    def warpper(request, *args, **kwargs):
        token = request.META.get("HTTP_AUTHORIZATION")
        try:
            token_entry = Token.objects.get(name=token)
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
    return JsonResponse({'code': 2, 'msg': 'this is index msg'})


# # @csrf_exempt
def login(request):
    return login_view.login(request)


def loginout(request):
    """
    退出登陆
    """
    return login_view.loginout(request)


@check_login
def get_role_list(request):
    """
    得到角色列表
    """
    return role_view.get_role_list(request)


@check_login
def users(request, id):
    """
    用户详情
    """
    return user_view.users(request, id)


@check_login
def user_del(request):
    """
    删除用户
    """
    return user_view.user_del(request)


@check_login
def user_edit(request):
    """
    编辑用户
    """
    return user_view.user_edit(request)


@check_login
def user_add(request):
    """
    新增用户
    """
    return user_view.user_add(request)


@check_login
def get_user_list(request):
    """
    用户列表
    """
    return user_view.get_user_list(request)


@check_login
def login_save(request):
    """
    测试api接口需要提前登陆的准备数据
    """
    return api_login_view.login_save(request)


@check_login
def login_test(request):
    """
    对api登陆接口进行测试
    """
    return api_login_view.login_test(request)


@check_login
def reports_module_case(request):
    """
    测试报告-图形展示-模块用例数量
    """
    return report_view.reports_module_case(request)


@check_login
def reports_top_10_slow(request):
    """
    响应时间最慢的top10
    """
    return report_view.reports_top_10_slow(request)


@check_login
def reports_top_slow_export(request):
    """
   导出top10最慢的接口信息
   """
    return report_view.reports_top_slow_export(request)


@check_login
def report_task(request):
    """
    测试报告-图形展示-每个任务中的成功和失败用例
    """
    return report_view.report_task(request)


@check_login
def reports_list(request):
    """
        测试报告-所有的测试报告列表
        """
    return report_view.reports_list(request)


@check_login
def report_export(request, id):
    """
    导出测试报告为excel
    id 为report的id
    """
    return report_view.report_export(request, id)


@check_login
def reports_detail(request, id):
    """
    测试报告详情
    id为report的id
    """
    return report_view.reports_detail(request, id)


@check_login
def report_detail_del(request):
    """
    删除测试报告
    """
    return report_view.report_detail_del(request)


@check_login
def get_all_suite(request):
    """
    得到套件列表
    """
    return suite_view.get_all_suite(request)


@check_login
def get_suite_list(request):
    """
    带条件的套件列表
    """
    return suite_view.get_suite_list(request)


@check_login
def suite_add(request):
    return suite_view.suite_add(request)


@check_login
def suite_edit(request):
    """
    编辑套件
    """
    return suite_view.suite_edit(request)


@check_login
def suite_detail(request, id):
    """
    套件详情
    """
    return suite_view.suite_detail(request, id)


@check_login
def suite_del(request):
    """
    删除套件
    """
    return suite_view.suite_del(request)


@check_login
def suite_to_case_list(request, id):
    """
    添加关联的用例列表
    """
    return suite_view.suite_to_case_list(request, id)


@check_login
def suite_set_case(request):
    """
    套件关联用例
    """
    return suite_view.suite_set_case(request)


@check_login
def get_case_all_list(request):
    """
    所有用例列表
    """
    return case_view.get_case_all_list(request)


@check_login
def get_case_list(request):
    """
    带分页和搜索的用例列表
    """
    return case_view.get_case_list(request)


@check_login
def case_add(request):
    """
    新增用例
    """
    return case_view.case_add(request)


@check_login
def case_detail(request, id):
    """
    用例详情
    """
    return case_view.case_detail(request, id)


@check_login
def case_edit(request):
    """
    用例编辑
    """
    return case_view.case_edit(request)


@check_login
def case_del(request):
    """
    用例删除
    """
    return case_view.case_del(request)


@check_login
def get_fuzz_list(request):
    """
    模糊用例规则
    """
    return fuzz_view.get_fuzz_list(request)


@check_login
def fuzz_add(request):
    """
    新增模糊用例规则
    """
    return fuzz_view.fuzz_add(request)


@check_login
def fuzz_detail(request, id):
    """
    模糊用例详情
    """
    return fuzz_view.fuzz_detail(request, id)


@check_login
def fuzz_edit(request):
    """
    用例编辑
    """
    return fuzz_view.fuzz_edit(request)


@check_login
def fuzz_del(request):
    """
    用例删除
    """
    return fuzz_view.fuzz_del(request)


@check_login
def get_timing_task_list(request):
    """
    获取定时任务列表
    """
    return timing_task_view.get_timing_task_list(request)


@check_login
def new_timing_task(request):
    """
    新建定时任务
    """
    return timing_task_view.new_timing_task(request)


@check_login
def timing_task_del(request):
    """
    删除定时任务
    """
    return timing_task_view.timing_task_del(request)


@check_login
def get_real_time_task_list(request):
    """
    实时任务列表
    """
    return real_time_task_view.get_real_time_task_list(request)


@check_login
def new_real_time_task(request):
    """
    新建实时任务
    """
    return real_time_task_view.new_real_time_task(request)


@check_login
def real_time_task_detail(request, id):
    """
    实时任务详情
    id为task得id
    """
    return real_time_task_view.real_time_task_detail(request, id)


@check_login
def real_time_task_del(request):
    """
    删除实时任务
    """
    return real_time_task_view.real_time_task_del(request)


# @check_login
def get_shop_list(request):
    """
    商品列表接口
    """
    return test_view.get_shop_list(request)


# @check_login
def shop_detail(request, id):
    """
    商品详情接口
    """
    return test_view.shop_detail(request, id)


# @check_login
def shop_add(request):
    """
    新增商品
    """
    return test_view.shop_add(request)


# @check_login
def logs(request):
    return log_view.logs(request)


# @check_login
def log_content(request):
    return log_view.log_content(request)
