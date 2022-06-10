1. Установите Bitwarden плагин для браузера. Зарегестрируйтесь и сохраните несколько паролей.

Добавил скрин к ДЗ

2. Установите Google authenticator на мобильный телефон. Настройте вход в Bitwarden акаунт через Google authenticator OTP.

Добавил скрин к ДЗ

3. Установите apache2, сгенерируйте самоподписанный сертификат, настройте тестовый сайт для работы по HTTPS.
Вот так я сгенерировал серт:
```
mkdir /etc/apache2/certificate 
cd /etc/apache2/certificate 
openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out apache-certificate.crt -keyout apache.key
```

И приложу содержимое конфига и внутренности html страницы, всё это работает:
```
<VirtualHost *:443> 
        # The ServerName directive sets the request scheme, hostname and port that 
        # the server uses to identify itself. This is used when creating 
        # redirection URLs. In the context of virtual hosts, the ServerName 
        # specifies what hostname must appear in the request's Host: header to 
        # match this virtual host. For the default virtual host (this file) this 
        # value is not decisive as it is used as a last resort host regardless. 
        # However, you must set it for any further virtual host explicitly. 
        #ServerName www.example.com 
        ServerAdmin razonmike@gmail.com 
        DocumentRoot /var/www/gci 
        ServerName gci.example.com 
        ServerAlias www.gci.example.com 
        DocumentRoot /var/www/gci 
        # Available loglevels: trace8, ..., trace1, debug, info, notice, warn, 
        # error, crit, alert, emerg. 
        # It is also possible to configure the loglevel for particular 
        # modules, e.g. 
        #LogLevel info ssl:warn 
        ErrorLog ${APACHE_LOG_DIR}/error.log 
        CustomLog ${APACHE_LOG_DIR}/access.log combined 
        SSLEngine on 
        SSLCertificateFile /etc/apache2/certificate/apache-certificate.crt 
        SSLCertificateKeyFile /etc/apache2/certificate/apache.key 
        # For most configuration files from conf-available/, which are 
        # enabled or disabled at a global level, it is possible to 
        # include a line for only one particular virtual host. For example the 
        # following line enables the CGI configuration for this host only 
        # after it has been globally disabled with "a2disconf". 
        #Include conf-available/serve-cgi-bin.conf 
</VirtualHost>
```

```
<html> 
<head> 
  <title> Netology </title> 
</head> 
<body> 
  <p> I'm running this website for netology DevOps course 
</body> 
</html>
```

4. Проверьте на TLS уязвимости произвольный сайт в интернете (кроме сайтов МВД, ФСБ, МинОбр, НацБанк, РосКосмос, РосАтом, РосНАНО и любых госкомпаний, объектов КИИ, ВПК ... и тому подобное).

Проверил на сервисе www.digicert.com
```
DNS разрешает netology.ru в 172.67.21.207 
Заголовок HTTP-сервера: cloudflare 
TLS-сертификат 
Общее название = netology.ru 
Организация = Cloudflare, Inc. 
Город/населенный пункт = Сан-Франциско 
Штат/провинция = Калифорния 
Страна = США 
Альтернативные имена субъекта = netology.ru, *.netology.ru 
Эмитент = Cloudflare Inc ECC CA-3 
Серийный номер = 0D4ECEE387AD78CF71CB53B10F6C1692 
Отпечаток SHA1 = 8BF9DC4CF2E2314801D3AE71CC0A6627D1E4231B 
Длина ключа = 256 
Алгоритм подписи = ECDSA-SHA256 
Безопасное повторное согласование: 
Сертификат TLS не был отозван 
Скрепка OCSP:	Хороший 
Происхождение ОССП:	Хороший 
CRL-статус:	Хороший 
Срок действия сертификата TLS 
Срок действия сертификата истекает 2 марта 2023 г. (271 день с сегодняшнего дня) 
Имя сертификата совпадает с netology.ru 
Предмет	netology.ru 
Действительно с 02.03.2022 по 02.03.2023 
Эмитент	Cloudflare Inc ECC CA-3 
Предмет	Cloudflare Inc ECC CA-3 
Действительно с 27 января 2020 г. по 31 декабря 2024 г. 
Эмитент	Балтимор CyberTrust Root 
Сертификат TLS установлен правильно 
Поздравляем! Этот сертификат установлен правильно.
```

5. Установите на Ubuntu ssh сервер, сгенерируйте новый приватный ключ. Скопируйте свой публичный ключ на другой сервер. Подключитесь к серверу по SSH-ключу.
```
vagrant@netology:~$ ssh-keygen -t rsa -b 4096 
Generating public/private rsa key pair. 
Enter file in which to save the key (/home/vagrant/.ssh/id_rsa): 
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/vagrant/.ssh/id_rsa 
Your public key has been saved in /home/vagrant/.ssh/id_rsa.pub 
The key fingerprint is: 
SHA256:Kanh5t0FO+//HyMAx9CkfA1nZtm3MhFKVUFDHWAB9P8 vagrant@netology 
The key's randomart image is: 
+---[RSA 4096]----+ 
|         .+*o@XB+| 
|        . =.@o .+| 
|         + = o. o| 
|       . .+  o.. | 
|    . o S  .  o. | 
|   . o . o  .   .| 
|    +   o .  . oE| 
|   o . . +    . o| 
|    . . ..o......| 
+----[SHA256]-----+
vagrant@netology:~$ ssh-copy-id vagrant@172.16.1.52 
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/vagrant/.ssh/id_rsa.pub" 
The authenticity of host '172.16.1.52 (172.16.1.52)' can't be established. 
ECDSA key fingerprint is SHA256:RztZ38lZsUpiN3mQrXHa6qtsUgsttBXWJibL2nAiwdQ. 
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes 
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed 
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys 
vagrant@172.16.1.52's password: 
Number of key(s) added: 1 
Now try logging into the machine, with:   "ssh 'vagrant@172.16.1.52'" 
and check to make sure that only the key(s) you wanted were added.
vagrant@netology:~$ ssh vagrant@172.16.1.52 
Enter passphrase for key '/home/vagrant/.ssh/id_rsa': 
Welcome to Ubuntu 20.04.3 LTS (GNU/Linux 5.4.0-91-generic x86_64)
```

6. Переименуйте файлы ключей из задания 5. Настройте файл конфигурации SSH клиента, так чтобы вход на удаленный сервер осуществлялся по имени сервера.
Переименуем файлы ключей
```
vagrant@netology:~/.ssh$ mv id_rsa.pub id_rsa1.pub &&mv id_rsa1 id_rsa1
```

Настройки на клиенте для подключения по имени и с указанием новых имен ключей. Подключение работает
```
vim .ssh/config

Host server
    HostName 172.16.1.51
    User vagrant
    PubkeyAuthentication yes
    IdentityFile ~/.ssh/id_rsa1
    IdentityFile ~/.ssh/id_rsa1.pub

sudo systemctl restart ssh

ssh server
```

7. Соберите дамп трафика утилитой tcpdump в формате pcap, 100 пакетов. Откройте файл pcap в Wireshark.
```
sudo tcpdump -c 100 > output.pcap
```

Далее скачал это файл, в Wireshark открыл File - Open - output.pcap

Задание для самостоятельной отработки (необязательно к выполнению)
8*. Просканируйте хост scanme.nmap.org. Какие сервисы запущены?
```
vagrant@netology:~$ sudo nmap -sV -allports -O -v scanme.nmap.org 
Starting Nmap 7.80 ( https://nmap.org ) at 2022-06-04 16:53 UTC 
NSE: Loaded 45 scripts for scanning. 
Initiating Ping Scan at 16:53 
Scanning scanme.nmap.org (45.33.32.156) [4 ports] 
Completed Ping Scan at 16:53, 0.04s elapsed (1 total hosts) 
Initiating Parallel DNS resolution of 1 host. at 16:53 
Completed Parallel DNS resolution of 1 host. at 16:53, 0.00s elapsed 
Initiating SYN Stealth Scan at 16:53 
Scanning scanme.nmap.org (45.33.32.156) [1000 ports] 
Discovered open port 80/tcp on 45.33.32.156 
Discovered open port 22/tcp on 45.33.32.156 
Discovered open port 31337/tcp on 45.33.32.156
```

открыто 3 порта 22 (SSH),  80 (HTTP) и 31337 (Back Orifice - Бэкдор, часто используется для троянов)

9*. Установите и настройте фаервол ufw на web-сервер из задания 3. Откройте доступ снаружи только к портам 22,80,443
```
vagrant@netology:~$ sudo ufw status 
Status: active 
To                         Action      From 
--                         ------      ---- 
Apache Full                ALLOW       Anywhere 
OpenSSH                    ALLOW       Anywhere
```

содержимое конфига
```
vagrant@netology:~$ sudo vim /etc/ufw/user.rules
*filter 
:ufw-user-input - [0:0] 
:ufw-user-output - [0:0] 
:ufw-user-forward - [0:0] 
:ufw-before-logging-input - [0:0] 
:ufw-before-logging-output - [0:0] 
:ufw-before-logging-forward - [0:0] 
:ufw-user-logging-input - [0:0] 
:ufw-user-logging-output - [0:0] 
:ufw-user-logging-forward - [0:0] 
:ufw-after-logging-input - [0:0] 
:ufw-after-logging-output - [0:0] 
:ufw-after-logging-forward - [0:0] 
:ufw-logging-deny - [0:0] 
:ufw-logging-allow - [0:0] 
:ufw-user-limit - [0:0] 
:ufw-user-limit-accept - [0:0] 
### RULES ### 
### tuple ### allow tcp 80,443 0.0.0.0/0 any 0.0.0.0/0 Apache%20Full - in 
-A ufw-user-input -p tcp -m multiport --dports 80,443 -j ACCEPT -m comment --comment 'dapp_Apache%20Full' 
### tuple ### allow tcp 22 0.0.0.0/0 any 0.0.0.0/0 OpenSSH - in 
-A ufw-user-input -p tcp --dport 22 -j ACCEPT -m comment --comment 'dapp_OpenSSH' 
### END RULES ### 
### LOGGING ### 
-A ufw-after-logging-input -j LOG --log-prefix "[UFW BLOCK] " -m limit --limit 3/min --limit-burst 10 
-A ufw-after-logging-forward -j LOG --log-prefix "[UFW BLOCK] " -m limit --limit 3/min --limit-burst 10 
-I ufw-logging-deny -m conntrack --ctstate INVALID -j RETURN -m limit --limit 3/min --limit-burst 10 
-A ufw-logging-deny -j LOG --log-prefix "[UFW BLOCK] " -m limit --limit 3/min --limit-burst 10 
-A ufw-logging-allow -j LOG --log-prefix "[UFW ALLOW] " -m limit --limit 3/min --limit-burst 10 
### END LOGGING ###
```
