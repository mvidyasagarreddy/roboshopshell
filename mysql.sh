echo -e "\e[31mDisable MySQL 8 version\e[0m"
dnf module disable mysql -y &>>/tmp/roboshop.log

echo -e "\e[31mCopy Mysql repo file\e[0m"
cp /home/centos/roboshopshell/mysql.repo /etc/yum.repos.d/mysql.repo &>>/tmp/roboshop.log

echo -e "\e[31mInstall MySQL Server\e[0m"
dnf install mysql-community-server -y &>>/tmp/roboshop.log

echo -e "\e[31mStart MySQL Service\e[0m"
systemctl enable mysqld &>>/tmp/roboshop.log
systemctl restart mysqld &>>/tmp/roboshop.log

echo -e "\e[3131mPassword Setup\e[0m"
mysql_secure_installation --set-root-pass RoboShop@1 &>>/tmp/roboshop.log

