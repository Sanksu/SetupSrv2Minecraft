# SetupSrv2Minecraft
在云主机上快速搭建原汁原味的Minecraft服务器  
目前只测试过腾讯云的轻量应用服务器，版本1.16.5、1.14.4,系统为	Ubuntu Server 20.04 LTS 64bit  
小白，第一次写shell，有问题请提Issues或直接帮我改吧(;w;)  

感谢 https://github.com/ToyoDAdoubi/doubi

# 使用
## Ubuntu
```
git clone https://github.com/Sanksu/SetupSrv2Minecraft
cd /SetupSrv2Minecraft
sudo su
bash SetupSrv2Minecraft_Ubuntu.sh
```
# 注意
- 生成文件保存在/home/Minecraft下
- 切记在防火墙内放行25565端口
- [server.properties配置](https://minecraft-zh.gamepedia.com/Server.properties)
- 默认运行参数为-Xmx1536M -Xms1024M
- 返回控制台
```
screen -r Minecraft
```
