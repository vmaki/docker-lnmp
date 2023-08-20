### kafka 创建主题

```bash
# 进入容器内
./kafka-topics.sh --create --zookeeper code_zookeeper:2181 --replication-factor 1 -partitions 1 --topic my-topic-test
```