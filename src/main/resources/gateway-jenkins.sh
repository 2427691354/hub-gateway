#!/usr/bin/env bash
app_name='gateway-jenkins'
docker stop ${app_name}
echo '----stop container----'
docker rm ${app_name}
echo '----rm container----'
docker run -p 9201:9201 --name ${app_name} \
--link mysql:db \
-v /etc/localtime:/etc/localtime \
-v /mydata/app/${app_name}/logs:/var/logs \
-d hub/${app_name}:1.0-SNAPSHOT
echo '----start container----'