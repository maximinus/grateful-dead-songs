# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('shows', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='playedsong',
            name='seque',
            field=models.BooleanField(default=False),
        ),
        migrations.AlterField(
            model_name='playedsong',
            name='order',
            field=models.IntegerField(default=1),
        ),
        migrations.AlterField(
            model_name='show',
            name='venue',
            field=models.ForeignKey(to='venues.Venue', null=True),
        ),
    ]
