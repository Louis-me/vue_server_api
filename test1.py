import requests

s = requests.Session()
resp = s.post("http://127.0.0.1:8100/myapi/login/", data={"user_name": "test1", "pwd": "12345678"})
print(resp.text)
# resp2 = s.get("http://127.0.0.1:8100/myapi/loginout/")
resp3 = s.get("http://127.0.0.1:8100/myapi/index/")


# print(resp2.text)
print(resp3.text)