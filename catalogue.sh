echo -e "\e[31mEnable nodejs 18 version \e[0m"
dnf module disable nodejs -y &>>/tmp/roboshop.log
dnf module enable nodejs:18 -y &>>/tmp/roboshop.log

echo -e "\e[31mInstall NodeJS\e[0m"
dnf install nodejs -y &>>/tmp/roboshop.log

echo -e "\e[31mAdd application User\e[0m"
useradd roboshop &>>/tmp/roboshop.log

echo -e "\e[31mSetup an app directory.\e[0m"
rm -rf /app &>>/tmp/roboshop.log
mkdir /app &>>/tmp/roboshop.log

echo -e "\e[31mDownload the application content\e[0m"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip  &>>/tmp/roboshop.log

echo -e "\e[31mExtract the App content\e[0m"
cd /app 
unzip /tmp/catalogue.zip &>>/tmp/roboshop.log

echo -e "\e[31mDownload the NodeJs dependencies.\e[0m"
npm install 

echo -e "\e[31mStart Catalogue service\e[0m"
systemctl daemon-reload &>>/tmp/roboshop.log
systemctl enable catalogue &>>/tmp/roboshop.log
systemctl restart catalogue &>>/tmp/roboshop.log

echo -e "\e[Copy- MongoDB repo\e[0m"
cp /home/centos/roboshopshell/mongo.repo /etc/yum.repos.d/mongo.repo &>>/tmp/roboshop.log

echo -e "\e[31mInstall mongodb-client\e[0m"
dnf install mongodb-org-shell -y &>>/tmp/roboshop.log

echo -e "\e[31mload schema to the Database\e[0m"
mongo --host mongodb-dev.devb73.store </app/schema/catalogue.js
 


