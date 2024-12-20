echo -e "\e[31mConfigure erlang Repos from the script provided by vendor.\e[0m"
curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | bash &>>/tmp/roboshop.log

echo -e "\e[31mConfigure rabbitmq Repos for rabbitmq.\e[0m"
curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | bash &>>/tmp/roboshop.log

echo -e "\e[31mInstall rabbitmq\e[0m"
dnf install rabbitmq-server -y &>>/tmp/roboshop.log

echo -e "\e[31mStart rabbitmq Service\e[0m"
systemctl enable rabbitmq-server &>>/tmp/roboshop.log
systemctl restart rabbitmq-server &>>/tmp/roboshop.log

echo -e "\e[31mAdd roboshop User\e[0m"
rabbitmqctl add_user roboshop roboshop123 &>>/tmp/roboshop.log

echo -e "\e[31mSet roboshop users permissons\e[0m"
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*" &>>/tmp/roboshop.log