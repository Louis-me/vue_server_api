# Generated by Django 3.1.3 on 2020-12-07 15:13

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('myapi', '0004_auto_20201207_2312'),
    ]

    operations = [
        migrations.RenameField(
            model_name='token',
            old_name='token',
            new_name='user',
        ),
    ]
