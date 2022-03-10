# -*- coding: utf-8 -*-
import ast
import json
from datetime import datetime

import requests
from myapi.base.fuzz_param import BaseFuzzParams
from myapi.models import Case


class ApiTask(object):
    @staticmethod
    def get_case_total_time(start_time, end_time):
        """
        得到用例的总耗时，统计格式为：hh-mm-ss
        :param start_time:  datetime.now().strftime("%H-%M-%S")
        :param end_time:
        :return:
        """
        formats = "%H-%M-%S"
        total_time = datetime.strptime(end_time, formats) - datetime.strptime(start_time, formats)
        return str(total_time)

    @staticmethod
    def get_case_total_time_ms(start_time, end_time):
        """
        得到每个用例耗时，统计单位为毫秒
        :param start_time:  datetime.datetime.now()
        :param end_time:
        :return:
        """
        total_time = (end_time - start_time).seconds * 1000 + (end_time - start_time).microseconds / 1000
        return str(total_time)

    @classmethod
    def exec_case_background(cls, case_entry, _report, is_fuzz):
        """
        :param case_entry 套件下关联的用例的实例类
        :param _report 新建测试总报告的实体类
        :param is_fuzz 是否开启fuzz
        后台执行任务,记录用例详情
        """
        protocol = case_entry.protocol
        name = case_entry.name
        method = case_entry.method
        params = case_entry.params
        hope = case_entry.hope
        hopes = hope.split("|")
        url = case_entry.url
        passed = 0
        failed = 0
        # print(protocol + "://" + url)
        # print(params)
        if params:
            params1 = ast.literal_eval(params)
        else:
            params1 = {}
        # 如果有参数和is_fuzz为真,就进行模糊测试

        if params1 and is_fuzz:
            f_code = 1
            for j in BaseFuzzParams().param_fi(params1):
                # hope1 = "code:2"
                hope1 = ""
                # 为1表示所有参数为真,取正向场景的检查点
                if f_code == 1:
                    hope1 = hope
                f_code = 2
                hopes1 = hope1.split("|")
                s_time = datetime.now()
                res = cls().request_(method, protocol, url, j)
                e_time = datetime.now()
                sum_time = ApiTask.get_case_total_time_ms(s_time, e_time)
                app = {"res": res, "sum_time": sum_time, "hopes": hopes1, "url": url, "protocol": protocol,
                       "params": j, "_report": _report, "name": "[模糊测试_%s]_%s" % (j["info"], name),
                       "method": method, "hope": hope1}
                result = cls.sum_report_item(app)

                # 同级用例结果
                if result == 1:
                    passed += 1
                else:
                    failed += 1
        else:
            s_time = datetime.now()
            # 进行正常测试
            res = cls().request_(method, protocol, url, params1)
            e_time = datetime.now()
            sum_time = ApiTask.get_case_total_time_ms(s_time, e_time)
            app = {"res": res, "sum_time": sum_time, "hopes": hopes, "url": url, "protocol": protocol,
                   "params": params1, "_report": _report, "name": name,
                   "method": method, "hope": hope}

            result = cls().sum_report_item(app)

            # 结果
            if result == 1:
                passed = 1
            else:
                failed += 1

        return {"passed": passed, "failed": failed}

    @classmethod
    def request_(cls, method, protocol, url, params1):
        """
        发送请求
        """
        headers = {'Content-Type': "application/json"}
        if method == "post":
            res = requests.post(url=protocol + "://" + url, json=params1, headers=headers)
        elif method == "get":
            res = requests.get(url=protocol + "://" + url, params=params1, headers=headers)
        else:
            res = {}
            print("只支持get,post")
        return res

    @classmethod
    def sum_report_item(cls, kwargs):
        """
        每个用例的执行情况写入测试报告详情页
        """
        res = kwargs.get("res")  # 请求后返回的数据
        hopes = kwargs.get("hopes")  # 已经切割好的期望结果[]
        # 把hopes转为dict
        hopes1 = {}
        if hopes[0] != '':
            for i in hopes:
                j = i.split(":")
                hopes1[j[0]] = j[1]

        hope = kwargs.get("hope")  # 期望结果
        url = kwargs.get("url")
        protocol = kwargs.get("protocol")  # 协议
        params = kwargs.get("params")  # 入参
        method = kwargs.get("method")  # 请求方法
        _report = kwargs.get("_report")  # 新建用例总报告后的实体类
        name = kwargs.get("name")  # 用例名字
        sum_time = kwargs.get("sum_time")

        if res.status_code == 200:
            # separators 表示去掉字典转换为字符中的空格
            # resp = json.dumps(json.loads(res.text), separators=(',', ':'))
            resp = json.loads(res.text)
            is_check = 1  # 0表示期望值不存在，没有进行检查;1成功;-1失败
            if len(hopes1) and len(hope): # 如果没有期望值，一般都是模糊用例，直接判断返回的code为200就算通过
                is_check = -1
                # 循环检查期望值是否在实际值中能找到
                for j in hopes1:
                    if resp.get(j):
                        if hopes1[j] == resp[j]:
                            is_check = 1
                            break

        else:
            resp = {"status_code": res.status_code}
            is_check = -1
        # 新建测试报告详情，写测试接口的值
        _report.reportitem_set.create(name=name, url=url, protocol=protocol, method=method,
                                      params=str(params)
                                      , hope=hope, sum_time=sum_time, fact=resp,
                                      result=is_check)
        return is_check
