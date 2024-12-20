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
curl -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip  &>>/tmp/roboshop.log

echo -e "\e[31mExtract the App content\e[0m"
cd /app 
unzip /tmp/cart.zip &>>/tmp/roboshop.log

echo -e "\e[31mDownload the NodeJs dependencies.\e[0m"
npm install 

echo -e "\e[31mStart cart service\e[0m"
systemctl daemon-reload &>>/tmp/roboshop.log
systemctl enable cart &>>/tmp/roboshop.log
systemctl restart cart &>>/tmp/roboshop.log
 


