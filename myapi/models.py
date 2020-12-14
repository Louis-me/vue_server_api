from django.db import models


# Create your models here.

class User(models.Model):
    id = models.IntegerField().primary_key
    name = models.CharField(max_length=128, unique=True)
    password = models.CharField(max_length=256)
    c_time = models.DateTimeField(auto_now_add=True)
    # 关联属性 (定义在多的一方)对应数据库表中的字段role_id。
    role = models.ForeignKey('Role', on_delete=models.CASCADE)

    def __str__(self):
        return self.name


class Role(models.Model):
    id = models.IntegerField().primary_key
    name = models.CharField(max_length=128, unique=True)


class Token(models.Model):
    id = models.IntegerField().primary_key
    name = models.CharField(max_length=1000, null=True)
    user = models.OneToOneField("User", null=True, on_delete=models.SET_NULL)
