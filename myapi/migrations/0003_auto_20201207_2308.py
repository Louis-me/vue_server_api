# Generated by Django 3.1.3 on 2020-12-07 15:08

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('myapi', '0002_auto_20201207_2257'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='token',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='myapi.token'),
        ),
    ]
