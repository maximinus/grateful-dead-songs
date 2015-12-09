# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('venues', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='venue',
            name='country',
            field=models.IntegerField(choices=[[0, b'USA'], [1, b'Canada'], [2, b'UK'], [3, b'France'], [4, b'Germany'], [5, b'Denmark'], [6, b'Sweden'], [7, b'Netherlands'], [8, b'Luxembourg'], [9, b'Eygpt'], [10, b'Jamaica'], [-1, b'Unknown']]),
        ),
    ]
