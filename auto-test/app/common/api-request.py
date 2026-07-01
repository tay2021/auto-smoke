import json
import requests


def send_request(method:          str,
                 base_url:        str,
                 uri:             str,
                 headers:         dict = None,
                 payload:         dict = None):
    """
    ### Send api-bak-bak request to server.
    :param method: put, get, delete, post
    :type method: str
    :param base_url: domain of server
    :type base_url: str
    :param uri: uri of api-bak-bak
    :type uri: str
    :param headers: header of request
    :type headers: dict
    :param payload: payload of request
    :type payload: dict

    :return: response dictionary
    :rtype: dict
    """
    headers = headers if headers else {}
    payload = payload if payload else {}
    payload = json.dumps(payload)
    headers = str(headers)
    headers = headers.replace("\'", "\"")
    headers = json.loads(headers)
    res = requests.request(method,
                           base_url+uri,
                           headers=headers,
                           data=payload)
    print(res.url)
    print(headers)
    print(res.content)
    print(res.status_code)
    print(res.text)
    return res