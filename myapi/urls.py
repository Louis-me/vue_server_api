from django.conf.urls import url
from django.contrib import admin
from myapi import views

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^index/', views.index),
    url(r'^login/', views.login),
    url(r'^loginout/', views.loginout),
]