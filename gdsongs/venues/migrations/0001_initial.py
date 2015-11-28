# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Venue',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=64)),
                ('city', models.CharField(max_length=64)),
                ('state', models.IntegerField(choices=[[-1, b'None'], [0, b'Alabama'], [1, b'Alaska'], [2, b'Arizona'], [3, b'Arkansas'], [4, b'California'], [5, b'Colorado'], [6, b'Connecticut'], [7, b'Delaware'], [8, b'District of Columbia'], [9, b'Florida'], [10, b'Georgia'], [11, b'Hawaii'], [12, b'Idaho'], [13, b'Illinois'], [14, b'Indiana'], [15, b'Iowa'], [16, b'Kansas'], [17, b'Kentucky'], [18, b'Louisiana'], [19, b'Maine'], [20, b'Maryland'], [21, b'Massachusetts'], [22, b'Michigan'], [23, b'Minnesota'], [24, b'Mississippi'], [25, b'Missouri'], [26, b'Montana'], [27, b'Nebraska'], [28, b'Nevada'], [29, b'New Hampshire'], [30, b'New Jersey'], [31, b'New Mexico'], [32, b'New York'], [33, b'North Carolina'], [34, b'North Dakota'], [35, b'Ohio'], [36, b'Oklahoma'], [37, b'Oregon'], [38, b'Pennsylvania'], [39, b'Rhode'], [40, b'South'], [41, b'South'], [42, b'Tennessee'], [43, b'Texas'], [44, b'Utah'], [45, b'Vermont'], [46, b'Virginia'], [47, b'Washington'], [48, b'West'], [49, b'Wisconsin'], [50, b'Wyoming']])),
                ('country', models.IntegerField(choices=[[0, b'USA'], [1, b'Canada'], [2, b'UK'], [3, b'France'], [4, b'Germany'], [5, b'Denmark'], [6, b'Sweden'], [7, b'Holland'], [8, b'Luxembourg'], [9, b'Eygpt'], [10, b'Jamaica'], [-1, b'Unknown']])),
                ('longitude', models.DecimalField(null=True, max_digits=10, decimal_places=7)),
                ('latitude', models.DecimalField(null=True, max_digits=10, decimal_places=7)),
            ],
        ),
    ]
