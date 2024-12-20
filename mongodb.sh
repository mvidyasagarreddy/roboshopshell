echo -e "\e[31mSetup the mongodb repo file\e[0m"
cp /home/centos/roboshopshell/mongo.repo /etc/yum.repos.d/mongo.repo

echo -e "\e[31mInstall mongodb\e[0m"
dnf install mongodb-org -y &>>/tmp/roboshop.log

echo -e "\e[31mUpdate mongodb listening address\e[0m"
sed -i -e s'/127.0.0.1/0.0.0.0/' /etc/mongod.conf &>>/tmp/roboshop.log

echo -e "\e[31mStart & Enable mongodb Service\e[0m"
systemctl enable mongod &>>/tmp/roboshop.log
systemctl restart mongod &>>/tmp/roboshop.log

