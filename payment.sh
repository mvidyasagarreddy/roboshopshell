echo -e "\e[31m\e[0m"
dnf install python36 gcc python3-devel -y >>/tmp/roboshop.log

echo -e "\e[31mAdd application User\e[0m"
useradd roboshop >>/tmp/roboshop.log

echo -e "\e[31mSetup an app directory.\e[0m"
mkdir /app >>/tmp/roboshop.log

echo -e "\e[31mDownload the application code to created app directory.\e[0m"
curl -L -o /tmp/payment.zip https://roboshop-artifacts.s3.amazonaws.com/payment.zip >>/tmp/roboshop.log
cd /app >>/tmp/roboshop.log

echo -e "\e[31mExtract App content\e[0m"
unzip /tmp/payment.zip >>/tmp/roboshop.log

echo -e "\e[31mDownload the dependencies\e[0m"
pip3.6 install -r requirements.txt >>/tmp/roboshop.log

echo -e "\e[31mStart the payment service\e[0m"
systemctl daemon-reload >>/tmp/roboshop.log
systemctl enable payment >>/tmp/roboshop.log
systemctl start payment >>/tmp/roboshop.log