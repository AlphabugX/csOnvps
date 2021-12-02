sudo apt update 
sudo apt install unrar uuid -y
wget -c https://github.com/AlphabugX/oracle_jdk/releases/download/jdk-8u202-linux-x64/jdk-8u202-linux-x64.tar.gz 
wget -c https://github.com/k8gege/Aggressor/releases/download/cs/K8_CS_4.4_20211109.rar

tar xf jdk-8u202-linux-x64.tar.gz 
ln -s ~/jdk1.8.0_202/bin/* /usr/bin/

unrar x K8_CS_4.4_20211109.rar -pk8gege.org
IP=`hostname -I`
PASSWORD=`uuid | md5sum |awk -F' ' '{ print $1}'`
cd K8_CS_4.4/
chmod 777 *
rm -rf cobaltstrike.store 
keytool -keystore cobaltstrike.store -storepass Microsoft -keypass Microsoft -genkey -keyalg RSA -alias baidu.com -dname "CN=US, OU="baidu.com", O="Sofatest", L=Beijing, ST=Cyberspace, C=CN"
echo $PASSWORD
./teamserver $IP $PASSWORD
