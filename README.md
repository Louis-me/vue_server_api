# ˵��

- ����Ŀ��Ҫ����Ϊѧϰvue���׵ķ����

##ʹ������

- ע��setting.py�е�mysql�����ݿ�����

```
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'mydb',  # ���ݿ�����
        'USER': 'root',  # �ʺ�
        'PASSWORD': '123456',  # ����
        'HOST': '127.0.0.1',  # IP
        'PORT': '3306',  # �˿�
    }
}
```

- Ǩ�����ݿ�

```
python manage.py makemigrations
python manage.py migrate
```


