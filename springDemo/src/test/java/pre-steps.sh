#bin bash
boss_host_ip=192.168.200.130 #远程主机IP
boss_userid=liuyan #用户名
boss_password=liuyan #密码
boss_remote_dir=/opt/apache-tomcat-8.5.16/webapps/ROOT/WEB-INF/classes #远程主机路径
local_dir=/root/.jenkins/workspace/xicar_maven_origin_tomcat/src/main/resources #本机路径

#修改文件夹权限、备份
/usr/bin/expect <<-EOF

spawn ssh root@$boss_host_ip
expect "*password:"
send "root\r"
expect  "#*" { send "cd /opt/apache-tomcat-8.5.16/webapps\r" }
expect  "#*" { send "chmod 777 -R ROOT\r" }
expect  "#*" { send "mv ROOT.war /usr/liuyan/ROOT.war-`date +'%Y%m%d'`\r" }
expect  "#*" { send "exit\r" }

EOF

#连接远程服务器，并取文件到本地
ftp -n $boss_host_ip <<endl
user $boss_userid  $boss_password
bin
prompt
cd $boss_remote_dir/
lcd $local_dir
mget *.xml *.properties
bye
endl

echo "success"