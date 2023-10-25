#! /bin/bash
yum -y install rsync-daemon
echo '123456789!' > /etc/rsync.pass
chmod 600 /etc/rsync.pass

yum -y install https://dl.fedoraproject.org/pub/epel/8/Everything/x86_64/Packages/i/inotify-tools-3.14-19.el8.x86_64.rpm

chmod +x /etc/rc.d/rc.local
cat >> /etc/rc.d/rc.local <<EOF
nohup /bin/bash /scripts/inotify.sh &
EOF
