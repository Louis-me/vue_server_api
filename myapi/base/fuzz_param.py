# -*- coding: utf-8 -*-

import uuid
from allpairspy import AllPairs
from myapi.models import Fuzz
# pip install allpairspy

from collections import OrderedDict




class BaseFuzzParams(object):

    def __get_data(self, d):
        """
        设置接口的逆向参数
           自动生成模糊接口参数第一步，提前准备逆向场景
           Args:
               d: dict类型，正向接口参数
           Returns:
              dict
           Raises:
              无
       """
        fuzzs = Fuzz.objects.all()

        data = {}
        for i in d:
            data[i] = []
            #  加入一般规则
            data[i].append({"info": "正确的值", "code": 1, "value": d[i], "key": i})
            for j in fuzzs:
                data[i].append({"code": j.fuzz_type, "key": i, "value": j.fuzz_content, "name":j.name})
        # 加入其它规则：如路径遍历，xss，注入

        return data

    '''
    最长输入内容文字
    '''

    def __max_text(self, key):
        return "’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发" \
               "发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120" \
               "dfa13131546489749411654‘132120 " \
               "第三方13131546489749411654132120" \
               "安抚ds 13131546489749411654132120‘"

    '''
    得到逆向场景参数后，用AllPairs生成全对偶参数
    '''

    def __set_fuzz(self, d):
        data = []
        for i, par in enumerate(AllPairs(OrderedDict(d))):
            app = []
            for j in par:
                app.append(j)
            data.append(app)

        dd = []
        for i in data:
            d = []
            for j in range(len(i)):
                d.append(i[j])
            dd.append(d)

        d2 = []
        for i in dd:
            d1 = []
            for j in i:
                app = {}
                """
                 0 表示参数不传内容
                 1 所有参数全部正确
                 -1 表示删除此参数
                 -2 表示传超长字符串
                 -3 表示自定义规则, 需要配合fuzz_content使用
                """

                if j.get("code") == -1:
                    info = "删除此参数"
                elif j.get("code") == 0:
                    app[j["key"]] = ""
                    info = "参数不传内容"
                elif j.get("code") == -2:
                    info = "超长字符串"
                    app[j["key"]] = self.__max_text(type(j("value")))
                elif j.get("code") == -3:
                    info = j.get("name")
                    app[j["key"]] = j.get("value")
                else:
                    app[j["key"]] = j["value"]
                    info = "参数正确"
                app["info"] = j["key"] + info
                d1.append(app)
            d2.append(d1)
        return d2

    '''
    对外的函数，处理生成的对偶场景接口参数
     Returns:
           [{},{}]
    '''

    def param_fi(self, d):
        g_data = self.__get_data(d)
        s_fuzz = self.__set_fuzz(g_data)
        data = []
        for i in s_fuzz:
            for j in range(len(i)):
                _info = ""
                for k in range(len(i)):
                    _info = _info + "," + i[k]["info"]
                    i[0].update(i[k])
                i[0]["info"] = _info.strip(",")
                data.append(i[0])
                break
        return data


if __name__ == "__main__":
    fz = BaseFuzzParams().param_fi(
        {"user": "name", "id": 1001, "pwd": "!@#$^&*", "data": {"test": "hello"}, "my_list": ["1", "2"]})
    print(fz)
