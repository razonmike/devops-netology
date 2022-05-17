Замечание:
Предлагаю уточнить как именно в службу будут передаваться дополнительные опции. Замечу, что речь идёт не о переменных окружения, а об опциях (параметрах) запуска службы.

Пояснение:

Я по какой то причине криво скопировал содержимое исполянемого файла, он должен быть с переменной $EXTRA_OPTS, которая в свою очередь находится в файле /usr/bin/node_exporter.

внутри этого файла находится опция:
```
EXTRA_OPTS="--log.level=info --version"
```

И при проверке статуса слубжы эта опиция отрабатывает и показывает версию сервиса:
```
root@netology:~# systemctl status node_exporter.service
● node_exporter.service - Prometheus Node Exporter
     Loaded: loaded (/etc/systemd/system/node_exporter.service; enabled; vendor preset: enabled)
     Active: inactive (dead) since Thu 2022-05-12 00:06:30 UTC; 2s ago
    Process: 2203 ExecStart=/usr/bin/node_exporter $EXTRA_OPTS (code=exited, status=0/SUCCESS)
   Main PID: 2203 (code=exited, status=0/SUCCESS)

May 12 00:06:30 netology systemd[1]: Started Prometheus Node Exporter.
May 12 00:06:30 netology node_exporter[2203]: node_exporter, version 1.3.1 (branch: HEAD, revision: a2321e7b940ddcff26873612bccdf7cd4c42b6b6)
May 12 00:06:30 netology node_exporter[2203]:   build user:       root@243aafa5525c
May 12 00:06:30 netology node_exporter[2203]:   build date:       20211205-11:09:49
May 12 00:06:30 netology node_exporter[2203]:   go version:       go1.17.3
May 12 00:06:30 netology node_exporter[2203]:   platform:         linux/amd64
```


Полностю содержимое файла выгляди так:
```
sudo vim /etc/systemd/system/node_exporter.service

[Unit] 
Description=Prometheus Node Exporter 
After=network.target 

[Service] 
Type=simple 
ExecStart=/usr/bin/node_exporter $EXTRA_OPTS
EnvironmentFile=/etc/default/node_exporter


[Install] 
WantedBy=multi-user.target
```


Так же я посмотрел те ссылки, которые вы прислали, там примеры посложнее, но суть примерно та же
```
ExecStart=/bin/bash -c 'v=%i; USE_GPU=$${v%:*} exec /bin/mycommand'

```

Так же описывается использование шаблонов через префикс @ - myservice@.service, но я так понимаю это не относится к вашему вопросу?
