# -*- coding: utf-8 -*-

# def get_session():
#     headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 6.0; WOW64; rv:24.0) Gecko/20100101 Firefox/24.0'}
#
#     s = requests.session()
#     l = Login.objects.get(pk=1)
#     url = l.url
#     data = json.loads(l.params)
#     # s.post(url, data, verify=False)
#     s.post(url, data, headers=headers, verify=False)
#     return s