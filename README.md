Задача 1
Опишите своими словами основные преимущества применения на практике IaaC паттернов.
Какой из принципов IaaC является основополагающим?
```
IaaC создан для решения задач максимально систематизированным образом. IaaC это процесс управления датацентрами и серверами с помощью машиночитаемых паттернов, созданный как альтернатива физической настройке оборудования системным администратором. Теперь, вместо того, чтобы запускать сотню различных файлов конфигурации вручную, IaaC позволяет просто запустить готовый скрипт паттерна, который в автоматическом режиме поднимет инфраструктуру, проверит каждую задачу на ошибки, исключая человеческий фактор.

Основополагающим принципом, в рамках IaaC, на мой взгляд является обеспечение идемпотентности. 
```

Задача 2
Чем Ansible выгодно отличается от других систем управление конфигурациями?
```
Ansible отосительно других систем прост в использовании, не требует установки агента на хостовую машину, имеет YAML-подобный DSL, написан на Python, а так же может расширяется за счет модулей-плагинов. 
```
Какой, на ваш взгляд, метод работы систем конфигурации более надёжный push или pull?
```
Метод push не требует установки агентов, в отличии от pull метода где такие агенты необходимы, что может быть причиной недоступности сервиса, в случае отказа или зависания агента
```

Задача 3
Установить на личный компьютер:
VirtualBox
```
Oracle VM VirtualBox VM Selector v6.1.32_Ubuntu
```
Vagrant
```
$ vagrant --version 
Vagrant 2.2.19
```
Ansible
```
vagrant@netology:~$ ansible --version 
ansible 2.9.6 
  config file = /etc/ansible/ansible.cfg 
  configured module search path = ['/home/vagrant/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules'] 
  ansible python module location = /usr/lib/python3/dist-packages/ansible 
  executable location = /usr/bin/ansible 
  python version = 3.8.10 (default, Mar 15 2022, 12:22:08) [GCC 9.4.0]
```

Приложить вывод команд установленных версий каждой из программ, оформленный в markdown.

Задача 4 (*)
Создать виртуальную машину.
Зайти внутрь ВМ, убедиться, что Docker установлен с помощью команды
```bash
root@netology:~/git_netology/05-virt-02-iaac/src/vagrant# vagrant ssh server1.netology 
Welcome to Ubuntu 20.04.4 LTS (GNU/Linux 5.4.0-110-generic x86_64) 
 * Documentation:  https://help.ubuntu.com 
 * Management:     https://landscape.canonical.com 
 * Support:        https://ubuntu.com/advantage 
  System information as of Tue 28 Jun 2022 07:53:32 PM UTC 
  System load:  0.28               Users logged in:          0 
  Usage of /:   13.0% of 30.63GB   IPv4 address for docker0: 172.17.0.1 
  Memory usage: 24%                IPv4 address for eth0:    10.0.2.15 
  Swap usage:   0%                 IPv4 address for eth1:    192.168.56.11 
  Processes:    114 
This system is built by the Bento project by Chef Software 
More information can be found at https://github.com/chef/bento 
Last login: Tue Jun 28 19:51:55 2022 from 10.0.2.2 
vagrant@server1:~$ docker ps 
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES 
vagrant@server1:~$
```
