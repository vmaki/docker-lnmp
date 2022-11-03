FROM nginx:1.15.5

#时区
ENV TZ Asia/Shanghai
RUN date -R

#容器启动时执行指令
CMD ["nginx", "-g", "daemon off;"]