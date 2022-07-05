1. Мы выгрузили JSON, который получили через API запрос к нашему сервису:

```json
{
  "info": "Sample JSON output from our service\t",
  "elements": [
    {
      "name": "first",
      "type": "server",
      "ip": 7175
    },
    {
      "name": "second",
      "type": "proxy",
      "ip : 71.78.22.43
    }
  ]
}
```

Добавил кавычки в строке "ip : 71.78.22.43

```json
{
  "info": "Sample JSON output from our service\t",
  "elements": [
    {
      "name": "first",
      "type": "server",
      "ip": 7175
    },
    {
      "name": "second",
      "type": "proxy",
      "ip": "71.78.22.43"
    }
  ]
}
```

2. В прошлый рабочий день мы создавали скрипт, позволяющий опрашивать веб-сервисы и получать их IP. К уже реализованному
   функционалу нам нужно добавить возможность записи JSON и YAML файлов, описывающих наши сервисы. Формат записи JSON по
   одному сервису: { "имя сервиса" : "его IP"}. Формат записи YAML по одному сервису: - имя сервиса: его IP. Если в
   момент исполнения скрипта меняется IP у сервиса - он должен так же поменяться в yml и json файле. Ваш скрипт:

```python
#!/usr/bin/ python3
import socket as s
import time as t
import datetime as dt
import json
import yaml

i = 1
wait = 1
srv = {'drive.google.com': '0.0.0.0', 'mail.google.com': '0.0.0.0', 'google.com': '0.0.0.0'}
init = 0
fpath = "/root/python/"
flog = "/root/python/errors.log"
print('ping checking...')
print(srv)
while True:
    for host in srv:
        is_error = False
        ip = s.gethostbyname(host)
        if ip != srv[host]:
            if i == 1 and init != 1:
                is_error = True
                with open(flog, 'a') as fl:
                    print(str(dt.datetime.now().strftime("%Y-%m-%d %H:%M:%S")) + ' [ERROR] ' + str(
                        host) + ' IP mistmatch: ' + srv[host] + ' ' + ip, file=fl)
                with open(fpath + host + ".json", 'w') as jsf:
                    json_data = json.dumps({host: ip})
                    jsf.write(json_data)
                with open(fpath + host + ".yaml", 'w') as ymf:
                    yaml_data = yaml.dump([{host: ip}])
                    ymf.write(yaml_data)
            srv[host] = ip
    print(i)
    i += 1
    if i >= 10:
        break
    t.sleep(wait)
print('check done')
```

Вывод скрипта при запуске при тестировании:

```bash
root@netology:~/python# ./ping_check.py
ping checking...
{'drive.google.com': '0.0.0.0', 'mail.google.com': '0.0.0.0', 'google.com': '0.0.0.0'}
1
2
3
4
5
6
7
8
9
check done
```

json-файл(ы), который(е) записал ваш скрипт:

```bash
root@netology:~/python# ls *.json
drive.google.com.json  google.com.json  mail.google.com.json

root@netology:~/python# cat *.json
{"drive.google.com": "64.233.163.194"}{"google.com": "64.233.164.113"}{"mail.google.com": "74.125.131.83"}
```

yml-файл(ы), который(е) записал ваш скрипт:

```bash
root@netology:~/python# ls *.yaml
drive.google.com.yaml  google.com.yaml  mail.google.com.yaml

root@netology:~/python# cat *.yaml
- drive.google.com: 64.233.163.194
- google.com: 64.233.164.113
- mail.google.com: 74.125.131.83
```

А так же файл с ошибками

```bash
root@netology:~/python# cat *.log
2022-07-05 16:39:41 [ERROR] drive.google.com IP mistmatch: 0.0.0.0 64.233.163.194
2022-07-05 16:39:41 [ERROR] mail.google.com IP mistmatch: 0.0.0.0 173.194.73.17
2022-07-05 16:39:41 [ERROR] google.com IP mistmatch: 0.0.0.0 142.251.1.138
```