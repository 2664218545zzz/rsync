#! /bin/bash
yum -y install rsync-daemon &&\
cat > /etc/rsyncd.conf <<EOF
log file = /var/log/rsyncd.log    
pidfile = /var/run/rsyncd.pid     
lock file = /var/run/rsync.lock 
secrets file = /etc/rsync.pass    
 
[etc_from_client]    
path = /tmp/          
comment = sync etc from client
uid = root        
gid = root        
port = 873        
ignore errors    
use chroot = no       
read only = no   
list = no   
max connections = 200     
timeout = 600     
auth users = admin       
hosts allow = 172.16.12.128   
hosts deny = 192.168.1.1      
EOF

echo 'admin:123456789!' > /etc/rsync.pass
chmod 600 /etc/rsync*
