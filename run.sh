function radom_key(){
    KEY=`uuid | md5sum |awk -F' ' '{ print $1}'`
    echo $KEY
}

sudo apt update && sudo apt install unrar uuid -y
if ((`curl https://github.com --connect-timeout 3 -m 3 -s | wc -l` > 10)) ; then
    echo "[+] Welcome to Github Script..."
    wget -c https://github.com/AlphabugX/oracle_jdk/releases/download/jdk-8u202-linux-x64/jdk-8u202-linux-x64.tar.gz 
    wget -c https://github.com/k8gege/Aggressor/releases/download/cs/K8_CS_4.4_20211109.rar
    wget -L https://raw.githubusercontent.com/AlphabugX/csOnvps/main/teamserver
else
    echo "[+] Welcome to Gitee Script..."
    wget -L https://gitee.com/Alphabug/csOnvps/attach_files/900305/download/jdk-8u202-linux-x64.tar.gz_part_aa
    wget -L https://gitee.com/Alphabug/csOnvps/attach_files/900305/download/jdk-8u202-linux-x64.tar.gz_part_ab
    wget -L https://gitee.com/Alphabug/csOnvps/attach_files/900361/download/K8_CS_4.4_20211109.rar
    cat jdk-8u202-linux-x64.tar.gz_part_* > jdk-8u202-linux-x64.tar.gz
    wget -L https://gitee.com/Alphabug/csOnvps/raw/master/teamserver
fi

tar xf jdk-8u202-linux-x64.tar.gz 
ln -s `pwd`/jdk1.8.0_202/bin/* /usr/bin/
unrar x K8_CS_4.4_20211109.rar -pk8gege.org

# 改K8 CS的默认配置，改成随机
PORT
IP=`curl ip.0xc2.cn`
PASSWORD=`radom_key`
KEYPASS=`radom_key`
cd K8_CS_4.4/
mv ../teamserver .
chmod 777 *

PORT=0
#判断当前端口是否被占用，没被占用返回0，反之1
function Listening {
   TCPListeningnum=`netstat -an | grep ":$1 " | awk '$1 == "tcp" && $NF == "LISTEN" {print $0}' | wc -l`
   UDPListeningnum=`netstat -an | grep ":$1 " | awk '$1 == "udp" && $NF == "0.0.0.0:*" {print $0}' | wc -l`
   (( Listeningnum = TCPListeningnum + UDPListeningnum ))
   if [ $Listeningnum == 0 ]; then
       echo "0"
   else
       echo "1"
   fi
}

function get_random_port {
   templ=0
   while [ $PORT == 0 ]; do
       temp1=`shuf -i $1-$2 -n1`
       if [ `Listening $temp1` == 0 ] ; then
              PORT=$temp1
       fi
   done
}
get_random_port 10000 65534;

# 配置teamserver
sed -i 's/SET_TEAMSERVER_PORT/$PORT/g' teamserver
sed -i 's/SET_TEAMSERVER_KEY/$KEYPASS/g' teamserver
echo "[+] Teamserver IP:" $IP
echo "[+] Teamserver Port:" $PORT
echo "[+] Teamserver Password:" $PASSWORD
echo "[+] Teamserver keyStorePassword:" $KEYPASS
nohup ./teamserver $IP $PASSWORD &
PID=`sudo ps -ef | grep $PASSWORD |awk -F" " '{ print $2 }' |tr "\n" " "`
echo "[+] Teamserver PID:" $PID
echo "[*] Teamserver stop command: kill -KILL " $PID
