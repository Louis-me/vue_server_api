# Generated by Django 3.1.3 on 2021-01-24 09:50

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('myapi', '0009_task_suite'),
    ]

    operations = [
        migrations.AlterField(
            model_name='report',
            name='task',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='myapi.task'),
        ),
        migrations.AlterField(
            model_name='task',
            name='suite',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='myapi.suite'),
        ),
    ]
