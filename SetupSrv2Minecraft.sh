#!/usr/bin/env bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

check_root(){
	[[ $EUID != 0 ]] && echo -e "${Error} 当前账号非ROOT(或没有ROOT权限)，无法继续操作，请使用${Green_background_prefix} sudo su ${Font_color_suffix}来获取临时ROOT权限（执行后会提示输入当前账号的密码）。" && exit 1
}

Install_Server1(){
    check_root
    apt install openjdk-8-jdk wget screen -y
    mkdir /home/Minecraft
    cd /home/Minecraft
}

Install_Server2(){
    echo "eula=true" > eula.txt
    echo "#!/usr/bin/env bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
java -Xmx1536M -Xms1024M -jar server.jar nogui" > run.sh
    ufw allow 25565/tcp
    echo "允许25565端口，对于个别服务器提供商，请前往控制台防火墙放行25565端口"
    echo "生成文件均在/home/Minecraft目录下"
}

Choose_Version(){
    echo -e "  Choose Version  ${Font_color_suffix}
    ---- dlserver2MC | 选择版本 ----
    ${Green_font_prefix}1.${Font_color_suffix} 安装1.16.5
    ${Green_font_prefix}2.${Font_color_suffix} 安装1.15.2
    ${Green_font_prefix}3.${Font_color_suffix} 安装1.14.4
    ${Green_font_prefix}4.${Font_color_suffix} 安装1.13.2
    ${Green_font_prefix}5.${Font_color_suffix} 安装1.12.2
    ${Green_font_prefix}6.${Font_color_suffix} 安装1.11.2
    ${Green_font_prefix}7.${Font_color_suffix} 安装1.10.2
    ${Green_font_prefix}8.${Font_color_suffix} 安装1.9.4
    ${Green_font_prefix}9.${Font_color_suffix} 安装1.8.9
    ${Green_font_prefix}10.${Font_color_suffix} 安装1.7.10
    "
    echo && read -e -p "请输入数字 [1-10]：" num
    case "$num" in
        1)
        wget https://launcher.mojang.com/v1/objects/1b557e7b033b583cd9f66746b7a9ab1ec1673ced/server.jar
        ;;
        2)
        wget https://launcher.mojang.com/v1/objects/bb2b6b1aefcd70dfd1892149ac3a215f6c636b07/server.jar
        ;;
        3)
        wget https://launcher.mojang.com/v1/objects/3dc3d84a581f14691199cf6831b71ed1296a9fdf/server.jar
        ;;
        4)
        wget https://launcher.mojang.com/v1/objects/3737db93722a9e39eeada7c27e7aca28b144ffa7/server.jar
        ;;
        5)
        wget https://launcher.mojang.com/v1/objects/886945bfb2b978778c3a0288fd7fab09d315b25f/server.jar
        ;;
        6)
        wget https://launcher.mojang.com/v1/objects/f00c294a1576e03fddcac777c3cf4c7d404c4ba4/server.jar
        ;;
        7)
        wget https://launcher.mojang.com/v1/objects/3d501b23df53c548254f5e3f66492d178a48db63/server.jar
        ;;
        8)
        wget https://launcher.mojang.com/v1/objects/edbb7b1758af33d365bf835eb9d13de005b1e274/server.jar
        ;;
        9)
        wget https://launcher.mojang.com/v1/objects/b58b2ceb36e01bcd8dbf49c8fb66c55a9f0676cd/server.jar
        ;;
        10)
        wget https://launcher.mojang.com/v1/objects/952438ac4e01b4d115c5fc38f891710c4941df29/server.jar
        ;;
        *)
        echo -e "${Error} 请输入正确的数字 [1-10]"
        ;;
    esac
}

Install(){
    Install_Server1
    Choose_Version
    Install_Server2
}

Run(){
    cd /home/Minecraft
    screen bash run.sh
}

Console(){
    screen -r
}

Uninstall(){
    rm -rf /home/Minecraft
}

echo -e "  dlserver2MC  ${Red_font_prefix}
---- Sanksu | dlserver2MC ----
${Green_font_prefix}1.${Font_color_suffix} 安装
${Green_font_prefix}2.${Font_color_suffix} 运行
${Green_font_prefix}3.${Font_color_suffix} 进入控制台
${Green_font_prefix}4.${Font_color_suffix} 卸载
"

echo && read -e -p "请输入数字 [1-4]：" num
case "$num" in
	1)
	Install
	;;
	2)
	Run
	;;
	3)
	Console
	;;
    4)
    Uninstall
    ;;
	*)
	echo -e "${Error} 请输入正确的数字 [1-4]"
	;;
esac
