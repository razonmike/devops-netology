Домашнее задание к занятию "5.3. Введение. Экосистема. Архитектура. Жизненный цикл Docker контейнера"

1. Сценарий выполнения задачи:
создайте свой репозиторий на https://hub.docker.com;
выберете любой образ, который содержит веб-сервер Nginx;
создайте свой fork образа;
реализуйте функциональность: запуск веб-сервера в фоне с индекс-страницей, содержащей HTML-код ниже:
```
<html>
<head>
Hey, Netology
</head>
<body>
<h1>I’m DevOps Engineer!</h1>
</body>
</html>
```
Опубликуйте созданный форк в своем репозитории и предоставьте ответ в виде ссылки на  https://hub.docker.com/username_repo.

```
https://hub.docker.com/repository/docker/razonmike/netology
```

С вашего позволения, я поправил html код, чтобы он корректно отображался на странице

![image](https://user-images.githubusercontent.com/16393583/181265353-6c6039d7-866d-40d5-94c2-b4a2136a7d13.png)

2. Посмотрите на сценарий ниже и ответьте на вопрос: "Подходит ли в этом сценарии использование Docker контейнеров или лучше подойдет виртуальная машина, физическая машина? Может быть возможны разные варианты?"
Детально опишите и обоснуйте свой выбор.

Сценарий:
```
- Высоконагруженное монолитное java веб-приложение 

Физический сервер или Виртуализация, так как предполагается выполнение одного сервиса, а отсутствие лишней абстрации в виде контейнера повысит производительность

- Nodejs веб-приложение 

Тут лучше подойдет докер, так как он запускается уже с готовым окружением для запуска веб-приложения и хорошо укладывается в микросервисную архитектуру

- Мобильное приложение c версиями для Android и iOS 

Если подразумевается, что дприложение запускаться на серверной части, то докер в данном случае может подойти, так как может быстро запускаться с версиями образов приложения. 

- Шина данных на базе Apache Kafka 

Если система не сильно нагруженная, то докер, с его помощью просто масштабировать и управлять сервисом. Но, если система высоконагруженная, то лучше развернуть на виртуалке или физическом сервере

- Elasticsearch кластер для реализации логирования продуктивного веб-приложения 

Для данных продуктов есть готовые образы на dockerhub. Поэтому мне кажется можно развернуть сервисы в докер контейнерах и на их основании собрать кластер Elasticsearch. В силу прозрачности реализации, в том числе возможности реализации через IaaC, контейнеризация в данном случае поможет решить вопросы по управлению и получить регулярный предсказуемый результат.

-  Мониторинг-стек на базе Prometheus и Grafana 

Так же как и в случае с ELK, можно развернуть всё с помощью контейнеризации и было бы не плохо применить IaaC.

- MongoDB, как основное хранилище данных для java-приложения

Все зависит от реализации архитектуры приложения и для чего данная БД будет развернута. Думаю, если нет репликации то подойдет докер, если она будет, то лучше использовать то виртуальную машину

- Gitlab сервер для реализации CI/CD процессов и приватный (закрытый) Docker Registry

Gitlab сервер для реализации CI/CD процессов лучше поднять в докер контейнере, а для Docker Registry достаточно использовать виртуальную машину.
```

3. Запустите первый контейнер из образа centos c любым тэгом в фоновом режиме, подключив папку /data из текущей рабочей директории на хостовой машине в /data контейнера;
Запустите второй контейнер из образа debian в фоновом режиме, подключив папку /data из текущей рабочей директории на хостовой машине в /data контейнера;
Подключитесь к первому контейнеру с помощью docker exec и создайте текстовый файл любого содержания в /data;
Добавьте еще один файл в папку /data на хостовой машине;
Подключитесь во второй контейнер и отобразите листинг и содержание файлов в /data контейнера.
```bash
root@netology:~/dockerhub# docker run -td -v /data:/data centos 
f8454434df3abac04eacaacdde3d380d2c7cac7c8f167ba14c4d774cf22ffbcd
root@netology:~/dockerhub# docker run -td -v /data:/data debian
591eb06294b4f04c8b94f78720e067a5741528a0f91fa7333944f4c9da37a380
root@netology:~/dockerhub# docker ps 
CONTAINER ID   IMAGE     COMMAND       CREATED         STATUS         PORTS     NAMES 
591eb06294b4   debian    "bash"        3 minutes ago   Up 3 minutes             infallible_mccarthy 
f8454434df3a   centos    "/bin/bash"   5 minutes ago   Up 5 minutes             happy_wu

root@netology:~/dockerhub# docker exec -it f8454434df3a /bin/bash
[root@f8454434df3a /]# cd data 
[root@f8454434df3a data]# touch file

root@netology:~/dockerhub# touch /data/file2

root@netology:~/dockerhub# docker exec -it 591eb06294b4 /bin/bash 
root@591eb06294b4:/# cd data 
root@591eb06294b4:/data# ls -l 
total 0 
-rw-r--r-- 1 root root 0 Jul  9 17:52 file 
-rw-r--r-- 1 root root 0 Jul  9 17:53 file2
```

4. Соберите Docker образ с Ansible, загрузите на Docker Hub и пришлите ссылку вместе с остальными ответами к задачам.
```
https://hub.docker.com/layers/250639170/razonmike/ansible/1.0/images/sha256-1edd026b8baf76330dd92aab3ad5e56b8e6622add2b0525012171162e3f55276?context=repo
```
