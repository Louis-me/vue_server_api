from django.db import models


# Create your models here.

class User(models.Model):
    id = models.IntegerField().primary_key
    name = models.CharField(max_length=128, unique=True)
    password = models.CharField(max_length=256)
    c_time = models.DateTimeField(auto_now_add=True)
    # 关联属性 (定义在多的一方)对应数据库表中的字段role_id。
    role = models.ForeignKey('Role', on_delete=models.CASCADE)

    # role = models.ForeignKey('Role', blank=True, null=True, on_delete=models.SET_NULL)

    def __str__(self):
        return self.name


class Role(models.Model):
    id = models.IntegerField().primary_key
    name = models.CharField(max_length=128, unique=True)


# 登陆后的token
class Token(models.Model):
    id = models.IntegerField().primary_key
    name = models.CharField(max_length=1000, null=True)
    user = models.OneToOneField("User", null=True, on_delete=models.SET_NULL)


# 测试接口前的登陆信息
class ApiLogin(models.Model):
    url = models.CharField(max_length=300)
    params = models.CharField(max_length=10000)
    method = models.CharField(max_length=10)

    def __str__(self):
        return self.url


# 套件
class Suite(models.Model):
    name = models.CharField(max_length=100)
    is_fuzz = models.BooleanField(default=False)  # 是否启动fuzz测试

    def __str__(self):
        return self.name


# 套件关联用例表
class SuiteSetCase(models.Model):
    # name = models.CharField(max_length=100)
    suite = models.ForeignKey('Suite', on_delete=models.CASCADE)
    case_id = models.IntegerField(null=True)


# 用例
class Case(models.Model):
    name = models.CharField(max_length=100)
    url = models.CharField(max_length=100)
    protocol = models.CharField(max_length=10)
    method = models.CharField(max_length=10)
    params = models.CharField(max_length=1000)
    hope = models.CharField(max_length=1000, null=True)
    # 多个用例关联一个套件
    suite = models.ForeignKey(Suite, null=True, on_delete=models.SET_NULL)

    def __str__(self):
        return self.name


# 模糊用例配置
class Fuzz(models.Model):
    name = models.CharField(max_length=100, default='')
    # 0表示参数不传内容,-1表示删除此参数,-2表示传超长字符串,-3表示自定义规则,需要配合fuzz_content使用
    fuzz_type = models.IntegerField(default=0)
    fuzz_content = models.CharField(max_length=10000, null=True)

    def __str__(self):
        return self.name


# 任务表
class Task(models.Model):
    name = models.CharField(max_length=100, default="")
    task_state = models.IntegerField(default=0)  # 0没有在测试，1测试中，2测试完成
    task_type = models.IntegerField(default=0)  # 1实时任务,2定时任务
    # 关联套件表
    suite = models.ForeignKey("Suite", null=True, on_delete=models.SET_NULL)


# 测试报告
class Report(models.Model):
    name = models.CharField(max_length=100)
    start_time = models.CharField(max_length=100)
    sum_time = models.CharField(max_length=10)
    passed = models.IntegerField(default=0)
    failed = models.IntegerField(default=0)
    no_check = models.IntegerField(default=0)
    log = models.CharField(max_length=100, null=True)
    report_path = models.CharField(max_length=100)
    #  套件用例执行的统计情况

    task = models.ForeignKey("Task", null=True, on_delete=models.SET_NULL)

    def __str__(self):
        return self.name


# 测试报告详情
class ReportItem(models.Model):
    report = models.ForeignKey(Report, null=True, on_delete=models.SET_NULL)

    name = models.CharField(max_length=100)
    url = models.CharField(max_length=100)
    protocol = models.CharField(max_length=10)
    method = models.CharField(max_length=10)
    params = models.CharField(max_length=1000)
    hope = models.CharField(max_length=100)
    sum_time = models.CharField(max_length=50)
    fact = models.CharField(max_length=10000)
    result = models.IntegerField(default=0)  # 1通过，-1失败，-2不检查

    def __str__(self):
        return self.name
