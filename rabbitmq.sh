echo -e "\e[31mConfigure YUM Repos from the script provided by vendor.\e[0m"
curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | bash &>>/tmp/roboshop.log

echo -e "\e[31mConfigure YUM Repos for RabbitMQ.\e[0m"
curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | bash &>>/tmp/roboshop.log

echo -e "\e[31mInstall RabbitMQ\e[0m"
dnf install rabbitmq-server -y &>>/tmp/roboshop.log

echo -e "\e[31mStart RabbitMQ Service\e[0m"
systemctl enable rabbitmq-server &>>/tmp/roboshop.log
systemctl start rabbitmq-server &>>/tmp/roboshop.log

echo -e "\e[31mAdd Roboshop User\e[0m"
rabbitmqctl add_user roboshop roboshop123 &>>/tmp/roboshop.log

echo -e "\e[31mSet roboshop users permissons\e[0m"
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*" &>>/tmp/roboshop.log