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
    url(r'^index/', views.index),
    url(r'^login/', views.login),
    url(r'^loginout/', views.loginout),
]