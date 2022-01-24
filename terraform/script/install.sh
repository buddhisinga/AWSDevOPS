# JAVA
sudo apt-get update
sudo apt-get install -y tree unzip
sudo apt install -y  gnupg2 pass
sudo apt install -y openjdk-11-jre-headless
java -version

# Jenkins
sudo useradd -m -s /bin/bash jenkins
sudo passwd jenkins
su - jenkins
mkdir jenkins
cd jenkins
wget https://get.jenkins.io/war-stable/2.319.1/jenkins.war
java -jar jenkins.war &

sudo apt-get install -y maven
# mvn -v

sudo apt-get install -y docker*
# docker version

sudo apt-get install -y software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible
ansible --version

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
# aws --version
# aws configure

sudo apt-get install git
git version