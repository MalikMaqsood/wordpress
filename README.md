# wordpress
Script to install wordpress on ubuntu 18.4 with apache2, mysql, php, phpmyadmin and vsftpd (FTP Server).
This is a test script for fun only to install wordpress on your ubuntu 18..4 server installation.
i have ubuntu 18.4 server on vmware on which i run this script to get wordpress for testing.
i have also tested it on lightsailAWS and it works fine.
i'm not using sudo in my script for any command so run
sudo su
first before running this script.
your default db will be 'wordpress' with user 'wpuser' and password 'wpuser123'
you can change this information in script.
run this script either by downloading wpinstall2.sh file by using this command
wget https://github.com/MalikMaqsood/wordpress/raw/master/wpinstall2.sh
and type following command to run the script after you download the file
bash ./wpinstall.sh
or by running this script directly from github by this command
bash <(curl -Ls https://github.com/MalikMaqsood/wordpress/raw/master/wpinstall2.sh)
after running the script type teh Ip of your machine in browser and you should see WP installation setup.
