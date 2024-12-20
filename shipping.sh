echo -e "\e[31mInstall Maven\e[0m"
dnf install maven -y &>>/tmp/roboshop.log

echo -e "\e[31mAdd roboshop user for application\e[0m"
useradd roboshop &>>/tmp/roboshop.log

echo -e "\e[31mRemove old app content\e[0m"
rm -rf /app &>>/tmp/roboshop.log
mkdir /app &>>/tmp/roboshop.log

echo -e "\e[31mDownload shipping Content\e[0m"
curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping.zip &>>/tmp/roboshop.log

echo -e "\e[31mExtract shipping content\e[0m"
cd /app &>>/tmp/roboshop.log
unzip /tmp/shipping.zip &>>/tmp/roboshop.log

echo -e "\e[31mDownload the dependencies\e[0m"
mvn clean package &>>/tmp/roboshop.log
mv target/shipping-1.0.jar shipping.jar &>>/tmp/roboshop.log

echo -e "\e[31mCopy shipping service file\e[0m"
cp /home/centos/roboshopshell/shipping.service /etc/systemd/system/shipping.service &>>/tmp/roboshop.log

echo -e "\e[31mInstall mysql\e[0m"
dnf install mysql -y &>>/tmp/roboshop.log

echo -e "\e[31mSetup mysql\e[0m"
mysql -h mysql-dev.devb73.store -uroot -pRoboShop@1 < /app/schema/shipping.sql &>>/tmp/roboshop.log

echo -e "\e[31mStart shipping service\e[0m"
systemctl daemon-reload &>>/tmp/roboshop.log
systemctl enable shipping &>>/tmp/roboshop.log
systemctl restart shipping &>>/tmp/roboshop.log