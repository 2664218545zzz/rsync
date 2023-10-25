# 在playbook指定主机
# 第一台为客户端
# 第二台为服务端

# 更改/modules/rsync下的两个脚本，更改实时同步的服务端目录与客户端路径
# 更改/modules/rsync下的inotify.sh，更改其中的ip为客户端ip

# 手动在服务端执行命令nohup bash /scripts/inotify.sh & 启动实时同步
# 或者重启自动触发开机自启同步服务脚本
