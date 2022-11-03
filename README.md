# Docker-LNMP

利用 Docker-Compose 编排 LNMP 开发环境  

## 清单

- PHP 7.3
- Nginx 1.15.5
- MySQL 5.7
- Redis

## 目录结构

```
Docker-LNMP
|--build                               DockerFile 文件目录
|----nginx-1.15.5
|----php73
|--docker                              Docker 目录
|----config                            配置目录
|------nginx                           Nginx  配置目录
|----data                              数据库数据目录
|------mysql                           Mysql 数据目录
|------redis                           Redis 数据目录
|----logs                              日志目录
|------nginx                           Nginx 日志目录
|------php                             PHP 日志目录
|----www                               应用根目录
|----README.md                         说明文件
|----docker-compose.yml                docker compose 配置文件
```

## 启动

```shell
docker-compose up -d
```

## 新建站点

比如部署一个 Laravel 项目，并且可以通过 http://laravel-app.test 访问：

### 1. 配置 Nginx

`./docker/config/nginx/conf.d` 目录下新建一个配置文件 `laravel-app.conf`，`lumen-app.conf` 内容如下：  

```nginx
server {
        listen 80;
        listen [::]:80;

        server_name laravel-app.test;
        root /var/www/html/laravel-app/public;
        index index.php index.html index.htm;

        location / {
            try_files $uri $uri/ /index.php$is_args$args;
        }

         location ~ \.php$ {
                include fastcgi_params;
                fastcgi_index index.php;
                fastcgi_pass php73:9000;
                fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
         }
 }
```

### 2. 安装 Laravel 项目

```shell
# 进入 php 容器内, 执行安装命令

# 1. 进入容器
$ docker exec -it php73 /bin/bash

# 2. 执行安装命令
$ ls
index.php
$ composer create-project laravel/laravel laravel-app --prefer-dist "8.*"
```

### 3. 修改本地 hosts 

```
# 这里本地用的是 Macbook，所以这里填的是 127.0.0.1，如果你用的是虚拟机，需要将 127.0.0.1 改成虚拟机的 IP 地址
127.0.0.1 laravel-app.test
```

### 4. 重启 Nginx

```shell
$ docker restart nginx
nginx
```

### 4. 浏览器访问

访问 http://laravel-app.test ，可以看到页面显示出内容就代表项目部署完成。  

## 常用 Docker 命令

```shell
# 进入容器
$ docker exec -it 容器名/容器id /bin/bash

# 重启容器
docker restart 容器名/容器id

# 删除所有容器
docker rm -f $(docker ps -aq)  

# 删除所有镜像
docker rmi $(docker images -q)
```
