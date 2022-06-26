Домашнее задание к занятию "4.1. Командная оболочка Bash: Практические навыки"

1. Есть скрипт:
```
a=1
b=2
c=a+b
d=$a+$b
e=$(($a+$b))
```
Какие значения переменным c,d,e будут присвоены?
Почему?
Сам скрипт:
```
#!/usr/bin/env bash
a=1
b=2
c=a+b
d=$a+$b
e=$(($a+$b))
echo $c && echo $d && echo $e
```
И его вывод:
```
vagrant@netology:~$ ./script.sh
a+b так как указали текст, а не сами переменные
1+2 тут были указаны переменные, следовательно вывело их данные, но так как не указаны скобки (()) арифметической операции не было
3 тут указаны скобки, поэтому выполнилась арифметическая операция
```

2. На нашем локальном сервере упал сервис и мы написали скрипт, который постоянно проверяет его доступность, записывая дату проверок до тех пор, пока сервис не станет доступным. В скрипте допущена ошибка, из-за которой выполнение не может завершиться, при этом место на Жёстком Диске постоянно уменьшается. Что необходимо сделать, чтобы его исправить:
```
while ((1==1)
do
curl https://localhost:4757
if (($? != 0))
then
date >> curl.log
fi
done
```

Я использовал существующий сервис netdata из прежнего дз, чтобы убедиться, что скрипт действительно работает:
```
#!/usr/bin/env bash
while ((1==1))
do
curl http://localhost:19999
if (($? != 0))
then
date >> curl.log
else exit
fi
done
```

1. Я добавил скобку в первой строке в ((1==1))
2. Я добавил операторы else (если предыдущее условие ложно, то выполнить следующую команду) и exit  оператор который завершает выполнение скрипта.

Ниже доказательство, что скрипт работает, я выключил сервис, запустил этот скрипт, чтобы он писал в лог, далее запустил сервис и мне curl выдал содержимое страницы и скрипт запершился
```
curl: (7) Failed to connect to localhost port 19999: Connection refused
curl: (7) Failed to connect to localhost port 19999: Connection refused
curl: (7) Failed to connect to localhost port 19999: Connection refused
curl: (7) Failed to connect to localhost port 19999: Connection refused
curl: (7) Failed to connect to localhost port 19999: Connection refused
curl: (7) Failed to connect to localhost port 19999: Connection refused
curl: (7) Failed to connect to localhost port 19999: Connection refused
curl: (7) Failed to connect to localhost port 19999: Connection refused
curl: (7) Failed to connect to localhost port 19999: Connection refused
curl: (7) Failed to connect to localhost port 19999: Connection refused
curl: (7) Failed to connect to localhost port 19999: Connection refused
curl: (7) Failed to connect to localhost port 19999: Connection refused
curl: (7) Failed to connect to localhost port 19999: Connection refused
curl: (7) Failed to connect to localhost port 19999: Connection refused
curl: (7) Failed to connect to localhost port 19999: Connection refused
curl: (7) Failed to connect to localhost port 19999: Connection refused
curl: (7) Failed to connect to localhost port 19999: Connection refused
<!doctype html><html lang="en"><head><title>netdata dashboard</title><meta name="application-name" content="netdata"><meta http-equiv="Content-Type" content="text/html; charset=utf-8"/><meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><meta name="viewport" content="width=device-width,initial-scale=1"><meta name="apple-mobile-web-app-capable" content="yes"><meta name="apple-mobile-web-app-status-bar-style" content="black-translucent"><meta name="author" content="costa@tsaousis.gr"><link rel="icon" href="data:image/x-icon;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAP9JREFUeNpiYBgFo+A/w34gpiZ8DzWzAYgNiHGAA5UdgA73g+2gcyhgg/0DGQoweB6IBQYyFCCOGOBQwBMd/xnW09ERDtgcoEBHB+zHFQrz6egIBUasocDAcJ9OxWAhE4YQI8MDILmATg7wZ8QRDfQKhQf4Cie6pAVGPA4AhQKo0BCgZRAw4ZSBpIWJNI6CD4wEKikBaFqgVSgcYMIrzcjwgcahcIGRiPYCLUPBkNhWUwP9akVcoQBpatG4MsLviAIqWj6f3Absfdq2igg7IIEKDVQKEzN5ofAenJCp1I8gJRTug5tfkGIdR1FDniMI+QZUjF8Amn5htOdHCAAEGACE6B0cS6mrEwAAAABJRU5ErkJggg=="/><meta property="og:locale" content="en_US"/><meta property="og:url" content="https://my-netdata.io"/><meta property="og:type" content="website"/><meta property="og:site_name" content="netdata"/><meta property="og:title" content="Get control of your Linux Servers. Simple. Effective. Awesome."/><meta property="og:description" content="Unparalleled insights, in real-time, of everything happening on your Linux systems and applications, with stunning, interactive web dashboards and powerful performance and health alarms."/><meta property="og:image" content="https://cloud.githubusercontent.com/assets/2662304/22945737/e98cd0c6-f2fd-11e6-96f1-5501934b0955.png"/><meta property="og:image:type" content="image/png"/><meta property="fb:app_id" content="1200089276712916"/><meta name="twitter:card" content="summary"/><meta name="twitter:site" content="@linuxnetdata"/><meta name="twitter:title" content="Get control of your Linux Servers. Simple. Effective. Aw
```

3. Необходимо написать скрипт, который проверяет доступность трёх IP: 192.168.0.1, 173.194.222.113, 87.250.250.242 по 80 порту и записывает результат в файл log. Проверять доступность необходимо пять раз для каждого узла.
```
#!/usr/bin/env bash
ip=(192.168.0.1 173.194.222.113 87.250.250.242)
timeout=3
p=80
date >>check_ip.log
for a in {1..5}
do
    for i in ${ip[@]}
    do
        curl -m $timeout $i:$p >/dev/null
        echo "Код проверки" $i status=$? >>check_ip.log
    done
done
```

```
vagrant@netology:~$ batcat check_ip.log
───────┬──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
       │ File: check_ip.log
───────┼──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   1   │ Sat 25 Jun 2022 10:51:31 PM UTC
   2   │ Код проверки 192.168.0.1 status=28
   3   │ Код проверки 173.194.222.113 status=0
   4   │ Код проверки 87.250.250.242 status=0
   5   │ Код проверки 192.168.0.1 status=28
   6   │ Код проверки 173.194.222.113 status=0
   7   │ Код проверки 87.250.250.242 status=0
   8   │ Код проверки 192.168.0.1 status=28
   9   │ Код проверки 173.194.222.113 status=0
  10   │ Код проверки 87.250.250.242 status=0
```

4. Необходимо дописать скрипт из предыдущего задания так, чтобы он выполнялся до тех пор, пока один из узлов не окажется недоступным. Если любой из узлов недоступен - IP этого узла пишется в файл error, скрипт прерывается
```
#!/usr/bin/env bash
ip=(173.194.222.113 87.250.250.242 192.168.0.1)
timeout=3
p=80
rs=0

while (($rs == 0))
do
    for i in ${ip[@]}
    do
        curl -m $timeout $i:$p >/dev/null
        rs=$?
        if (($rs !=0))
        then
            echo "Не доступен" $i status=$rs >>error_ip.log
        fi
    done
done
```

```
vagrant@netology:~$ cat error_ip.log
Не доступен 192.168.0.1 status=28
```
