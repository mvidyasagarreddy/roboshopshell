echo -e "\e[31mInstalling Nginx\e[0m"
dnf install nginx -y &>>/tmp/roboshop.log


echo -e "\e[31mRemove old app content.\e[0m"
rm -rf /usr/share/nginx/html/* &>>/tmp/roboshop.log

echo -e "\e[31mDownloading the frontend content\e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip &>>/tmp/roboshop.log

echo -e "\e[31mExtract the frontend content\e[0m"
cd /usr/share/nginx/html 
unzip /tmp/frontend.zip &>>/tmp/roboshop.log

echo -e "\e[31mCopy Nginx Reverse Proxy Configuration.\e[0m"
cp /home/centos/Roboshop-Shell/roboshop.conf /etc/nginx/default.d/roboshop.conf


echo -e "\e[31mStart Nginx\e[0m"
systemctl enable nginx &>>/tmp/roboshop.log
systemctl restart nginx &>>/tmp/roboshop.log