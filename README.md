1. Есть скрипт:
```python
#!/usr/bin/env python3
a = 1
b = '2'
c = a + b
```

Какое значение будет присвоено переменной c?      Выйдет ошибка, TypeError: unsupported operand type(s) for +: 'int' and 'str', данные типы не соответсвуют операции
Как получить для переменной c значение 12?    Исправить на c = str (a) + b
Как получить для переменной c значение 3?    Исправить на c = a + int (b)

2. 
Мы устроились на работу в компанию, где раньше уже был DevOps Engineer. Он написал скрипт, позволяющий узнать, какие файлы модифицированы в репозитории, относительно локальных изменений. Этим скриптом недовольно начальство, потому что в его выводе есть не все изменённые файлы, а также непонятен полный путь к директории, где они находятся. Как можно доработать скрипт ниже, чтобы он исполнял требования вашего руководителя?
```python
#!/usr/bin/env python3

import os

bash_command = ["cd ~/netology/sysadm-homeworks", "git status"]
result_os = os.popen(' && '.join(bash_command)).read()
is_change = False
for result in result_os.split('\n'):
    if result.find('modified') != -1:
        prepare_result = result.replace('\tmodified:   ', '')
        print(prepare_result)
        break
```

Мой скрипт:

```python
#!/usr/bin/env python3

import os

bash_command = ["cd ~/git_netology", "git status"] 
result_os = os.popen(' && '.join(bash_command)).read() 
for result in result_os.split('\n'): 
    if result.find('modified') != -1: 
        prepare_result = result.replace('\tmodified:   ', '') 
        print(f'/home/vagrant/git_netology/{prepare_result}')
```

Вывод скрипта при запуске при тестировании:

```bash
vagrant@netology:~/git_netology$ git status                                                                                                                                                                                                                 
On branch master  
No commits yet 
Changes to be committed: 
  (use "git rm --cached <file>..." to unstage) 
        new file:   test.py 
Changes not staged for commit: 
  (use "git add <file>..." to update what will be committed) 
  (use "git restore <file>..." to discard changes in working directory) 
        modified:   test.py

vagrant@netology:~$ ./check_git_status.py   
/home/vagrant/git_netology/test.py
```

3. Доработать скрипт выше так, чтобы он мог проверять не только локальный репозиторий в текущей директории, а также умел воспринимать путь к репозиторию, который мы передаём как входной параметр. Мы точно знаем, что начальство коварное и будет проверять работу этого скрипта в директориях, которые не являются локальными репозиториями.
```python
#!/usr/bin/env python3 
import os 
import sys

param = sys.argv[1] 
bash_command = [f'cd {param}', "git status"] 
result_os = os.popen(' && '.join(bash_command)).read() 
for result in result_os.split('\n'): 
    if result.find('modified') != -1: 
        prepare_result = result.replace('\tmodified:   ', '') 
        print(f'{param}/{prepare_result}')
```

Вывод
```bash
vagrant@netology:~$ git status                                                                                                                                                                           
On branch master  
No commits yet 
Changes to be committed: 
  (use "git rm --cached <file>..." to unstage) 
        new file:   git_netology/test.py 
Changes not staged for commit: 
  (use "git add <file>..." to update what will be committed) 
  (use "git restore <file>..." to discard changes in working directory) 
        modified:   git_netology/test.py

vagrant@netology:~$ ./check_git_status2.py /home/vagrant/git_netology 
/home/vagrant/git_netology/test.py
```

4. Наша команда разрабатывает несколько веб-сервисов, доступных по http. Мы точно знаем, что на их стенде нет никакой балансировки, кластеризации, за DNS прячется конкретный IP сервера, где установлен сервис. Проблема в том, что отдел, занимающийся нашей инфраструктурой очень часто меняет нам сервера, поэтому IP меняются примерно раз в неделю, при этом сервисы сохраняют за собой DNS имена. Это бы совсем никого не беспокоило, если бы несколько раз сервера не уезжали в такой сегмент сети нашей компании, который недоступен для разработчиков. Мы хотим написать скрипт, который опрашивает веб-сервисы, получает их IP, выводит информацию в стандартный вывод в виде: <URL сервиса> - <его IP>. Также, должна быть реализована возможность проверки текущего IP сервиса c его IP из предыдущей проверки. Если проверка будет провалена - оповестить об этом в стандартный вывод сообщением: [ERROR] <URL сервиса> IP mismatch: <старый IP> <Новый IP>. Будем считать, что наша разработка реализовала сервисы: drive.google.com, mail.google.com, google.com.

```python
#!/usr/bin/env python3

import socket as s 
import time as t 
import datetime as dt

i = 1 
wait = 1 
srv = {'drive.google.com':'0.0.0.0', 'mail.google.com':'0.0.0.0', 'google.com':'0.0.0.0'} 
init=0

print('*** start script ***') 
print(srv) 
print('********************')

while 1==1 : 
  for host in srv: 
    ip = s.gethostbyname(host) 
    if ip != srv[host]: 
      if i==1 and init !=1: 
        print(str(dt.datetime.now().strftime("%Y-%m-%d %H:%M:%S")) +' [ERROR] ' + str(host) +' IP mistmatch: '+srv[host]+' '+ip) 
      srv[host]=ip
```

```bash
vagrant@netology:~$ ./ping_http.py 
*** start script *** 
{'drive.google.com': '0.0.0.0', 'mail.google.com': '0.0.0.0', 'google.com': '0.0.0.0'} 
******************** 
2022-06-27 23:20:04 [ERROR] drive.google.com IP mistmatch: 0.0.0.0 74.125.131.194 
2022-06-27 23:20:04 [ERROR] mail.google.com IP mistmatch: 0.0.0.0 209.85.233.17 
2022-06-27 23:20:04 [ERROR] google.com IP mistmatch: 0.0.0.0 173.194.220.101 
2022-06-27 23:20:20 [ERROR] mail.google.com IP mistmatch: 209.85.233.17 209.85.233.18 
2022-06-27 23:20:20 [ERROR] mail.google.com IP mistmatch: 209.85.233.18 209.85.233.17 
2022-06-27 23:20:28 [ERROR] google.com IP mistmatch: 173.194.220.101 173.194.220.113
2022-06-27 23:20:29 [ERROR] google.com IP mistmatch: 108.177.14.101 108.177.14.138
```
