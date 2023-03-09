help:
	@echo "usage: make COMMAND"
	@echo ""
	@echo "clean: 一键清空 Docker 容器跟镜像"
	@echo "rmDS: 快速删除文件夹下的.DS_Store文件"

clean:
	docker rm -f $(docker ps -aq)
	docker rmi $(docker images -qa)

rmDS:
	find . -name .DS_Store| xargs rm -rf
