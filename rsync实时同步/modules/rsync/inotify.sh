host=192.168.187.134     
src=/etc        
des=etc_from_client     
password=/etc/rsync.pass        
user=admin          
inotifywait=/usr/bin/inotifywait
 
$inotifywait -mrq --timefmt '%Y%m%d %H:%M' --format '%T %w%f%e' -e modify,delete,create,attrib $src \
| while read files;do
    rsync -avzP --delete  --timeout=100 --password-file=${password} $src $user@$host::$des
    echo "${files} was rsynced" >>/tmp/rsync.log 2>&1
done
