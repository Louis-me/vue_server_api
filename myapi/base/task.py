# -*- coding: utf-8 -*-
from datetime import datetime

import requests


class ApiTask(object):
    @staticmethod
    def get_case_total_time(start_time, end_time):
        """
        得到用例的总耗时
        :param start_time:  datetime.now().strftime("%H:%M:%S")
        :param end_time:
        :return:
        """
        formats = "%H:%M:%S"
        total_time = datetime.strptime(end_time, formats) - datetime.strptime(start_time, formats)
        return str(total_time)
