1. Подключитесь к публичному маршрутизатору в интернет. Найдите маршрут к вашему публичному IP
```
telnet route-views.routeviews.org
Username: rviews
show ip route x.x.x.x/32
show bgp x.x.x.x/32

```

```
route-views>show ip route 176.232.59.73 
Routing entry for 176.232.56.0/22 
  Known via "bgp 6447", distance 20, metric 10 
  Tag 3257, type external 
  Last update from 89.149.178.10 3w2d ago 
  Routing Descriptor Blocks: 
  * 89.149.178.10, from 89.149.178.10, 3w2d ago 
      Route metric is 10, traffic share count is 1 
      AS Hops 2 
      Route tag 3257 
      MPLS label: none
```

```
route-views>show ip bgp 176.232.59.73 
BGP routing table entry for 176.232.56.0/22, version 2285914994 
Paths: (24 available, best #21, table default) 
  Not advertised to any peer 
  Refresh Epoch 1 
  3333 1103 3257 34984 
    193.0.0.56 from 193.0.0.56 (193.0.0.56) 
      Origin IGP, localpref 100, valid, external 
      Community: 3257:4000 3257:8989 3257:50001 3257:50111 3257:59000 3257:59002 
      path 7FE132CE6518 RPKI State valid 
      rx pathid: 0, tx pathid: 0 
  Refresh Epoch 1 
  8283 38930 3257 34984 
    94.142.247.3 from 94.142.247.3 (94.142.247.3) 
      Origin IGP, metric 0, localpref 100, valid, external 
      Community: 8283:14 8283:102 
      unknown transitive attribute: flag 0xE0 type 0x20 length 0x18 
        value 0000 205B 0000 0005 0000 0002 0000 205B 
              0000 0006 0000 000E 
      path 7FE1046EC398 RPKI State valid 
      rx pathid: 0, tx pathid: 0 
  Refresh Epoch 1 
  53767 174 174 3257 34984 
    162.251.163.2 from 162.251.163.2 (162.251.162.3) 
      Origin IGP, localpref 100, valid, external 
      Community: 174:21000 174:22013 53767:5000 
      path 7FE12DD93148 RPKI State valid 
      rx pathid: 0, tx pathid: 0 
  Refresh Epoch 1 
  3549 3356 3257 34984 
    208.51.134.254 from 208.51.134.254 (67.16.168.191) 
      Origin IGP, metric 0, localpref 100, valid, external 
      Community: 3257:3257 3356:3 3356:22 3356:86 3356:575 3356:666 3356:901 3356:2011 3549:2581 3549:30840 
      path 7FE0A2A6E368 RPKI State valid 
      rx pathid: 0, tx pathid: 0 
  Refresh Epoch 1 
  19214 3257 34984 
    208.74.64.40 from 208.74.64.40 (208.74.64.40) 
      Origin IGP, localpref 100, valid, external 
      Community: 3257:4000 3257:8989 3257:50001 3257:50111 3257:59000 3257:59002 
      path 7FE0D9BD11F0 RPKI State valid 
      rx pathid: 0, tx pathid: 0 
  Refresh Epoch 1 
  701 3257 34984 
    137.39.3.55 from 137.39.3.55 (137.39.3.55) 
      Origin IGP, localpref 100, valid, external 
      path 7FE0AEF33468 RPKI State valid 
      rx pathid: 0, tx pathid: 0 
  Refresh Epoch 1 
  3356 3257 34984 
    4.68.4.46 from 4.68.4.46 (4.69.184.201) 
      Origin IGP, metric 0, localpref 100, valid, external 
      Community: 3257:3257 3356:3 3356:86 3356:576 3356:666 3356:901 3356:2012 
      path 7FE08D77EA28 RPKI State valid 
      rx pathid: 0, tx pathid: 0 
  Refresh Epoch 1 
  3561 209 3356 3257 34984 
    206.24.210.80 from 206.24.210.80 (206.24.210.80) 
      Origin IGP, localpref 100, valid, external 
      path 7FE0489A63A8 RPKI State valid 
      rx pathid: 0, tx pathid: 0 
  Refresh Epoch 1 
  57866 6830 3257 34984 
    37.139.139.17 from 37.139.139.17 (37.139.139.17) 
      Origin IGP, metric 0, localpref 100, valid, external 
      Community: 3257:3257 6830:17000 6830:17442 6830:33125 57866:501 
      path 7FE037C85AB0 RPKI State valid 
      rx pathid: 0, tx pathid: 0 
  Refresh Epoch 1 
  7018 3257 34984 
    12.0.1.63 from 12.0.1.63 (12.0.1.63) 
      Origin IGP, localpref 100, valid, external 
      Community: 7018:5000 7018:37232 
      path 7FE04FE73B38 RPKI State valid 
      rx pathid: 0, tx pathid: 0 
  Refresh Epoch 1 
  4901 6079 3257 34984 
    162.250.137.254 from 162.250.137.254 (162.250.137.254) 
      Origin IGP, localpref 100, valid, external 
      Community: 65000:10100 65000:10300 65000:10400 
      path 7FE0FA47CDE8 RPKI State valid 
      rx pathid: 0, tx pathid: 0 
  Refresh Epoch 1 
  20912 3257 34984 
    212.66.96.126 from 212.66.96.126 (212.66.96.126) 
      Origin IGP, localpref 100, valid, external 
      Community: 3257:4000 3257:8989 3257:50001 3257:50111 3257:59000 3257:59002 20912:65004 
      path 7FE0D9E7CF98 RPKI State valid 
      rx pathid: 0, tx pathid: 0 
  Refresh Epoch 1 
  3267 1299 3257 34984 
    194.85.40.15 from 194.85.40.15 (185.141.126.1) 
      Origin IGP, metric 0, localpref 100, valid, external 
      path 7FE15079FB98 RPKI State valid 
      rx pathid: 0, tx pathid: 0 
  Refresh Epoch 1 
  49788 1299 3257 34984 
    91.218.184.60 from 91.218.184.60 (91.218.184.60) 
      Origin IGP, localpref 100, valid, external 
      Community: 1299:20000 
      Extended Community: 0x43:100:1 
      path 7FE10E491D70 RPKI State valid 
      rx pathid: 0, tx pathid: 0 
  Refresh Epoch 1 
  20130 23352 3257 34984 
    140.192.8.16 from 140.192.8.16 (140.192.8.16) 
      Origin IGP, localpref 100, valid, external 
      path 7FE15FA70E20 RPKI State valid 
      rx pathid: 0, tx pathid: 0 
  Refresh Epoch 1 
  101 174 3257 34984 
    209.124.176.223 from 209.124.176.223 (209.124.176.223) 
      Origin IGP, localpref 100, valid, external 
      Community: 101:20100 101:20110 101:22100 174:21000 174:22013 
      Extended Community: RT:101:22100 
      path 7FE030E97988 RPKI State valid 
      rx pathid: 0, tx pathid: 0 
  Refresh Epoch 1 
  852 3257 34984 
    154.11.12.212 from 154.11.12.212 (96.1.209.43) 
      Origin IGP, metric 0, localpref 100, valid, external 
      path 7FE0D63DA298 RPKI State valid 
      rx pathid: 0, tx pathid: 0 
  Refresh Epoch 1 
  1351 6939 1299 3257 34984 
    132.198.255.253 from 132.198.255.253 (132.198.255.253) 
      Origin IGP, localpref 100, valid, external 
      path 7FE179E542E8 RPKI State valid 
      rx pathid: 0, tx pathid: 0 
  Refresh Epoch 1 
  3303 3257 34984 
    217.192.89.50 from 217.192.89.50 (138.187.128.158) 
      Origin IGP, localpref 100, valid, external 
      Community: 3257:3257 3303:1004 3303:1006 3303:1030 3303:3067 
      path 7FE08B981CC0 RPKI State valid 
      rx pathid: 0, tx pathid: 0 
  Refresh Epoch 1 
  6939 1299 3257 34984 
    64.71.137.241 from 64.71.137.241 (216.218.252.164) 
      Origin IGP, localpref 100, valid, external 
      path 7FE0ECDD8CA8 RPKI State valid 
      rx pathid: 0, tx pathid: 0 
  Refresh Epoch 1 
  3257 34984 
    89.149.178.10 from 89.149.178.10 (213.200.83.26) 
      Origin IGP, metric 10, localpref 100, valid, external, best 
      Community: 3257:4000 3257:8989 3257:50001 3257:50111 3257:59000 3257:59002 
      path 7FE118B155A8 RPKI State valid 
      rx pathid: 0, tx pathid: 0x0 
  Refresh Epoch 2 
  2497 3257 34984 
    202.232.0.2 from 202.232.0.2 (58.138.96.254) 
      Origin IGP, localpref 100, valid, external 
      path 7FE0B48312E8 RPKI State valid 
      rx pathid: 0, tx pathid: 0 
  Refresh Epoch 1 
  7660 2516 3257 34984 
    203.181.248.168 from 203.181.248.168 (203.181.248.168) 
      Origin IGP, localpref 100, valid, external 
      Community: 2516:1030 7660:9001 
      path 7FE162E1DF50 RPKI State valid 
      rx pathid: 0, tx pathid: 0 
  Refresh Epoch 1 
  1221 4637 3257 34984 
    203.62.252.83 from 203.62.252.83 (203.62.252.83) 
      Origin IGP, localpref 100, valid, external 
      path 7FE14661BBE8 RPKI State valid 
      rx pathid: 0, tx pathid: 0
```

2. Создайте dummy0 интерфейс в Ubuntu. Добавьте несколько статических маршрутов. Проверьте таблицу маршрутизации.

```
vagrant@netology:~$ sudo modprobe -v dummy numdummies=1 
insmod /lib/modules/5.4.0-110-generic/kernel/drivers/net/dummy.ko numdummies=0 numdummies=1

vagrant@netology:~$ ip a | grep dummy
4: dummy0: <BROADCAST,NOARP> mtu 1500 qdisc noop state DOWN group default qlen 1000

vagrant@netology:~$ sudo ip link set dummy0 up

vagrant@netology:~$ sudo ip addr add 192.168.1.150/24 dev dummy0
vagrant@netology:~$ sudo ip route add 0.0.0.0/0 via 192.168.1.150

vagrant@netology:~$ ip r | grep dummy
default via 192.168.1.150 dev dummy0
192.168.1.0/24 dev dummy0 proto kernel scope link src 192.168.1.150
```

3. Проверьте открытые TCP порты в Ubuntu, какие протоколы и приложения используют эти порты? Приведите несколько примеров.
```
vagrant@netology:~$ sudo ss -nltp
State           Recv-Q          Send-Q                   Local Address:Port                    Peer Address:Port         Process
LISTEN          0               4096                           0.0.0.0:19999                        0.0.0.0:*             users:(("netdata",pid=644,fd=5))
LISTEN          0               4096                     127.0.0.53%lo:53                           0.0.0.0:*             users:(("systemd-resolve",pid=610,fd=13))
LISTEN          0               128                            0.0.0.0:22                           0.0.0.0:*             users:(("sshd",pid=693,fd=3))
LISTEN          0               4096                         127.0.0.1:8125                         0.0.0.0:*             users:(("netdata",pid=644,fd=61))
LISTEN          0               4096                              [::]:19999                           [::]:*             users:(("netdata",pid=644,fd=6))
LISTEN          0               128                               [::]:22                              [::]:*             users:(("sshd",pid=693,fd=4))
```

4. Проверьте используемые UDP сокеты в Ubuntu, какие протоколы и приложения используют эти порты?
```
vagrant@netology:~$ sudo ss -nlup
State           Recv-Q          Send-Q                    Local Address:Port                   Peer Address:Port         Process
UNCONN          0               0                             127.0.0.1:8125                        0.0.0.0:*             users:(("netdata",pid=644,fd=56))
UNCONN          0               0                         127.0.0.53%lo:53                          0.0.0.0:*             users:(("systemd-resolve",pid=610,fd=12))
UNCONN          0               0                        10.0.2.15%eth0:68                          0.0.0.0:*             users:(("systemd-network",pid=608,fd=21))
```

5. Используя diagrams.net, создайте L3 диаграмму вашей домашней сети или любой другой сети, с которой вы работали.

Прикрепил файл к ЛК
