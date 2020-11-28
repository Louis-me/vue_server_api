# 说明

- 此项目主要了是为学习vue配套的服务端

##使用设置

- 注意setting.py中的mysql的数据库设置

```
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'mydb',  # 数据库名字
        'USER': 'root',  # 帐号
        'PASSWORD': '123456',  # 密码
        'HOST': '127.0.0.1',  # IP
        'PORT': '3306',  # 端口
    }
}
```

- 迁移数据库

```
python manage.py makemigrations
python manage.py migrate
```


