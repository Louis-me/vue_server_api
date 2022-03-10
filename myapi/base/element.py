# -*- coding=utf-8 -*-

import os

PATH = lambda p: os.path.abspath(
    os.path.join(os.path.dirname(__file__), p)
)


class Element(object):
    REPORT_FILE = PATH("../Report/")  # 测试报告
    HOST = "http://127.0.0.1:8100/"