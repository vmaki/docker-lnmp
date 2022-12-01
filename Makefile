help:
	@echo "usage: make COMMAND"
	@echo ""
	@echo "Commands:"
	@echo "clean: 一键清空 Docker 容器跟镜像"

init:
	echo '123'

clean:
	docker rm -f $(docker ps -aq)
	docker rmi $(docker images -qa)
