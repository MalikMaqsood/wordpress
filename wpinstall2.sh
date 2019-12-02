#!/bin/bash

clear
apt update
apt install vsftpd unzip lamp-server^
sed -i 's/#write_enable=YES/write_enable=YES/g' /etc/vsftpd.conf
service vsftpd restart
# following commands will created wordpress database and wpuser with wpuser123 password >>>
clear
echo "Please enter root user MySQL password!"
read rootpasswd
mysql -uroot -p${rootpasswd} -e "CREATE DATABASE wordpress;"
mysql -uroot -p${rootpasswd} -e "CREATE USER 'wpuser'@'localhost' IDENTIFIED BY 'wpuser123';"
mysql -uroot -p${rootpasswd} -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wpuser'@'localhost';"
mysql -uroot -p${rootpasswd} -e "FLUSH PRIVILEGES;"

cd /var/www/html
wget http://wordpress.org/latest.zip
unzip /var/www/html/latest.zip
mv /var/www/html/wordpress/* /var/www/html/
rm -rf /var/www/html/wordpress

chown -R www-data.www-data /var/www/html
rm index.html

cp /var/www/html/wp-config-sample.php wp-config.php
sed -i 's/database_name_here/wordpress/g' /var/www/html/wp-config.php
sed -i 's/username_here/wpuser/g' /var/www/html/wp-config.php
sed -i 's/password_here/wpuser123/g' /var/www/html/wp-config.php

sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 20M/g' /etc/php/7.2/apache2/php.ini
sed -i 's/max_file_uploads = 20/max_file_uploads = 200/g' /etc/php/7.2/apache2/php.ini

apt install phpmyadmin php-mbstring php-gettext
phpenmod mbstring
a2enmod rewrite

sed -i "s/'select_expr'] == 1)/'select_expr']) == 1)/g"  /usr/share/phpmyadmin/libraries/sql.lib.php
sed -i "s/'*')))/'))/g" /usr/share/phpmyadmin/libraries/sql.lib.php

sed -z 's/None/All/3' /etc/apache2/apache2.conf

service apache2 restart
clear
ifconfig
