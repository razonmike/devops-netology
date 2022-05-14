Домашнее задание к лекции №3.4

1. На лекции мы познакомились с node_exporter. В демонстрации его исполняемый файл запускался в background. Этого достаточно для демо, но не для настоящей production-системы, где процессы должны находиться под внешним управлением. Используя знания из лекции по systemd, создайте самостоятельно простой unit-файл для node_exporter:

```
sudo vim /etc/systemd/system/node_exporter.service

[Unit] 
Description=Prometheus Node Exporter 
After=network.target 

[Service] 
Type=simple 
ExecStart=/usr/bin/node_exporter
EnvironmentFile=/etc/default/node_exporter


[Install] 
WantedBy=multi-user.target
```

поместите его в автозагрузку
systemctl enable node_exporter.service

предусмотрите возможность добавления опций к запускаемому процессу через внешний файл (посмотрите, например, на systemctl cat cron),
```
EXTRA_OPTS="--log.level=info --version"
```

удостоверьтесь, что с помощью systemctl процесс корректно стартует, завершается, а после перезагрузки автоматически поднимается.
Проверил, после перезагрузки ВМ процесс корректно стартует, запускается автоматически. Завершается без ошибок
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

2. Ознакомьтесь с опциями node_exporter и выводом /metrics по-умолчанию. Приведите несколько опций, которые вы бы выбрали для базового мониторинга хоста по CPU, памяти, диску и сети.
```
CPU 
node_cpu_seconds_total{cpu="0",mode="idle"} 
node_cpu_seconds_total{cpu="0",mode="iowait"}  
node_cpu_seconds_total{cpu="0",mode="irq"} 
node_cpu_seconds_total{cpu="0",mode="nice"} 
node_cpu_seconds_total{cpu="0",mode="softirq"} 
node_cpu_seconds_total{cpu="0",mode="steal"} 
node_cpu_seconds_total{cpu="0",mode="system"} 
node_cpu_seconds_total{cpu="0",mode="user"}  
   
RAM
node_memory_MemAvailable_bytes
node_memory_MemFree_bytes
node_memory_MemTotal_bytes

HDD
node_disk_io_time_seconds_total{device="sda"} 
node_disk_read_bytes_total{device="sda"} 
node_disk_read_time_seconds_total{device="sda"} 
node_disk_write_time_seconds_total{device="sda"}
node_disk_discard_time_seconds_total{device="sda"}
node_disk_written_bytes_total{device="sda"}
node_disk_writes_completed_total{device="sda"}

Networking
node_network_carrier_up_changes_total{device="eth0"} 
node_network_carrier_up_changes_total{device="eth1"}
node_network_carrier_down_changes_total{device="eth0"} 
node_network_carrier_down_changes_total{device="eth1"}
node_network_carrier{device="eth0"} 
node_network_carrier{device="eth1"}
node_network_info{address="08:00:27:10:e3:d3",broadcast="ff:ff:ff:ff:ff:ff",device="eth1",duplex="full",ifalias="",operstate="up"} 
node_network_info{address="08:00:27:b1:28:5d",broadcast="ff:ff:ff:ff:ff:ff",device="eth0",duplex="full",ifalias="",operstate="up"}
node_network_receive_bytes_total{device="eth0"} 
node_network_receive_bytes_total{device="eth1"}
node_network_receive_drop_total{device="eth0"} 
node_network_receive_drop_total{device="eth1"}
node_network_receive_errs_total{device="eth0"} 
node_network_receive_errs_total{device="eth1"}
```


3. Установите в свою виртуальную машину Netdata. Воспользуйтесь готовыми пакетами для установки (sudo apt install -y netdata). После успешной установки:

	в конфигурационном файле /etc/netdata/netdata.conf в секции [web] замените значение с localhost на bind to = 0.0.0.0,
	добавьте в Vagrantfile проброс порта Netdata на свой локальный компьютер и сделайте vagrant reload:
```
config.vm.network "forwarded_port", guest: 19999, host: 19999
```

После успешной перезагрузки в браузере на своем ПК (не в виртуальной машине) вы должны суметь зайти на localhost:19999. Ознакомьтесь с метриками, которые по умолчанию собираются Netdata и с комментариями, которые даны к этим метрикам.

4. Можно ли по выводу dmesg понять, осознает ли ОС, что загружена не на настоящем оборудовании, а на системе виртуализации?

```
vagrant@netology:~$ dmesg | grep -i virtual
[    0.000000] DMI: innotek GmbH VirtualBox/VirtualBox, BIOS VirtualBox 12/01/2006
[    0.008812] CPU MTRRs all blank - virtualized system.
[    0.064297] Booting paravirtualized kernel on KVM
[   21.664313] systemd[1]: Detected virtualization oracle.
```

5. Как настроен sysctl fs.nr_open на системе по-умолчанию? Узнайте, что означает этот параметр. Какой другой существующий лимит не позволит достичь такого числа (ulimit --help)?

Этот параметр означает максимальное количество открытых файловых дескрипторов для системы, для юзера поменять на больше число невозможно. Число кратно 1024, 1024*1024 = 1048576
```
vagrant@netology:~$ /sbin/sysctl -n fs.nr_open
1048576
```

лимит на пользователя можно посмотреть командой, его невозможно увеличить
```
vagrant@vagrant:~$ ulimit -Hn
1048576
```

Максимальный лимит можно узнать командой:
```
vagrant@netology:~$ cat /proc/sys/fs/file-max
9223372036854775807
```

6. Запустите любой долгоживущий процесс (не ls, который отработает мгновенно, а, например, sleep 1h) в отдельном неймспейсе процессов; покажите, что ваш процесс работает под PID 1 через nsenter. Для простоты работайте в данном задании под root (sudo -i). Под обычным пользователем требуются дополнительные опции (--map-root-user) и т.д.

В первом tty запускаю процесс  в отдельном неймспейсе
```
root@netology:# unshare --fork --pid --mount-proc sleep 1h
```

Во втором tty перехватываю данный процесс
```
root@netology:# ps -ef | grep sleep 
root        2804    2803  0 09:50 pts/0    00:00:00 sleep 1h

root@netology:~# nsenter --target 2804 --pid --mount 
root@netology:/# ps aux 
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND 
root           1  0.0  0.0   5476   580 pts/0    S+   09:50   0:00 sleep 1h 
root           2  0.1  0.4   7236  4100 pts/1    S    09:52   0:00 -bash 
root          13  0.0  0.3   8888  3448 pts/1    R+   09:52   0:00 ps aux
```

7. Найдите информацию о том, что такое :(){ :|:& };:. Запустите эту команду в своей виртуальной машине Vagrant с Ubuntu 20.04 (это важно, поведение в других ОС не проверялось). Некоторое время все будет "плохо", после чего (минуты) – ОС должна стабилизироваться. Вызов dmesg расскажет, какой механизм помог автоматической стабилизации. Как настроен этот механизм по-умолчанию, и как изменить число процессов, которое можно создать в сессии?

Форк-бомба — это форма атаки типа «отказ в обслуживании» (DoS) против системы на базе Linux или Unix. Она использует операцию форка.
Данная команда -  функция bash. Она выполняется рекурсивно. Может использоваться системным администратором для проверки ограничений пользовательских процессов на сервере. Ограничения процессов Linux можно настроить с помощью /etc/security/limits.conf и PAM, чтобы избежать бомбы bash fork().

Вызов dmesg
```
cgroup: fork rejected by pids controller in /user.slice/user-1000.slice/session-2.scope
```

pids controller - используется, чтобы позволить иерархии контрольной группы предотвратить любые новые задачи от fork() или clone() после достижения максимального количества процессов
user.slice - место по умолчанию для всех пользовательских сессий. 

ulimit -u    Данная команда покажет текущее максимальное количество процессов, которые пользователь может запустить в Linux

Чтобы изменить это чисто нужно ввести команду 
```
ulimit -S -u 5000
```

где 5000 это количество процессов в сеансе пользователя
Флаг -S     Мягкий лимит. Любой процесс может изменить мягкое ограничение.
Флаг -u    Указывает, сколько процессов может создать пользователь.
