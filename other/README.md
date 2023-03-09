# Docker-Other

利用 Docker-Compose 编排一些乱七八糟的服务

## 清单

- Elasticsearch 7.12.0
- Kibana 7.12.0
- RabbitMQ 3.9

## 目录结构

```
other
|--docker                              Docker 目录
|----config                            配置目录
|------kibana                          Kibana  配置目录
|----data                              数据库数据目录
|------es                              Elasticsearch 数据目录
|------rabbitmq                        RabbitMQ 数据目录
|----plugins                           插件目录
|------es                              Elasticsearch 插件目录
|--README.md                           说明文件
|--docker-compose.yml                  docker compose 配置文件
```

## 启动

```shell
docker-compose up -d
```

## Elasticsearch 安装分词器

### 1. 进入容器

```bash
docker exec -it elasticsearch /bin/bash
```

### 2. 安装分词器

```bash
# 先进入 bin 目录
cd bin

# 执行安装命令
./elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v7.12.0/elasticsearch-analysis-ik-7.12.0.zip
```

### 3. 重启 docker 容器

```shell
docker restart other-elasticsearch
```
