from django.conf.urls import url
from django.contrib import admin
from django.urls import path

from myapi import views

urlpatterns = [
    url(r'^get_user_list/', views.get_user_list),
    url(r'^get_role_list/', views.get_role_list),
    url(r'^user_add/', views.user_add),
    url(r'^user_edit/', views.user_edit),
    url(r'^user_del/', views.user_del),
    path('users/<int:id>/', views.users),
    path('get_case_list/', views.get_case_list), # 带条件的用例列表
    path('get_case_all_list/', views.get_case_all_list), # 全部用例列表
    path('case_add/', views.case_add),
    path('case_detail/<int:id>', views.case_detail),  # 用例详情
    path('case_edit/', views.case_edit), # 编辑用例
    path('case_del/', views.case_del), # 删除用例
    path('login_test', views.login_test),
    path('login_save', views.login_save),
    path('get_suite_list/', views.get_suite_list),
    path('get_all_suite/', views.get_all_suite),
    path('suite_to_case_list/<int:id>/', views.suite_to_case_list),
    path('suite_add/', views.suite_add),
    path('suite_detail/<int:id>/', views.suite_detail),
    path('suite_edit/', views.suite_edit),
    path('suite_del/', views.suite_del),
    path('suite_set_case/', views.suite_set_case),
    path('new_real_time_task/', views.new_real_time_task),
    path('get_real_time_task_list/', views.get_real_time_task_list),
    path('real_time_task_detail/<int:id>/', views.real_time_task_detail),
    url(r'^index/', views.index),
    url(r'^login/', views.login),
    url(r'^loginout/', views.loginout),
    url(r'^get_shop_list', views.get_shop_list),
    url(r'^shop_detail/<int:id>', views.shop_detail),
    url(r'^shop_add', views.shop_add),
]