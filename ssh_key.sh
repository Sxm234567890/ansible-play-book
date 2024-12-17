#!/bin/bash
#***********
#auth:songxiaomin
#date:2024-12-17
#***********
IPLIST="
192.168.75.133
192.168.75.136
192.168.75.132
192.168.75.134
192.168.75.135
"
rpm -q sshpass &>/dev/null || yum -y install sshpass
[ -f /root/.ssh/id_rsa ] || ssh-keygen -f  /root/.ssh/id_rsa -P ''
export SSHPASS=123456   #目标主机的密码

for IP in $IPLIST;do
   { sshpass -e ssh-copy-id -o StrictHostKeyChecking=no $IP; } &  #把任务放到后台
done
wait    #等所有后台任务完成，再结束脚本
