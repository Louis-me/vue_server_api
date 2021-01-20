import requests

s = requests.Session()
resp = s.post("http://127.0.0.1:8100/myapi/login/", json={"username": "test1", "pwd": "1234567"})
print(resp.text)
resp2 = s.get("http://127.0.0.1:8100/myapi/get_shop_list/")
# # resp3 = s.get("http://127.0.0.1:8100/myapi/index/")


print(resp2.text)
# print(resp3.text)


# import uuid
# print(uuid.uuid1())