# My-Docker

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

#查看容器日志
docker logs --since 30m 容器名/容器id
```
