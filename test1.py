import json
import time
from datetime import datetime

import requests

s = requests.Session()
# resp = s.post("http://www.shikun.work:8081/myapi/login/", json={"username": "admin", "pwd": "123456"})
# resp = s.post("http://127.0.0.1:8000/myapi/login/", json={"username": "admin", "pwd": "123456"})
# print(resp.text)
# resp2 = requests.get("http://127.0.0.1:8000/myapi/reports_module_case")
# print(resp2.text)
# # # resp3 = s.get("http://127.0.0.1:8100/myapi/index/")
#
# resp = s.get("http://127.0.0.1:8000/myapi/logs")
# print(resp.text)
data = {"name": "1.log", "root": "d:\log"}
resp = requests.post(r"http://127.0.0.1:8000/myapi/log_content", json=data)
print(resp.text)


