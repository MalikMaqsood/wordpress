### wordpress
Script to install WordPress on Ubuntu 18.4 with apache2, MySQL, php, phpmyadmin and vsftpd (FTP Server).

This is a test script for fun only to install WordPress on your Ubuntu 18..4 server installation.

I have Ubuntu 18.4 server on VMware on which i run this script to get WordPress for testing.

I have also tested it on AWSLightsail and it works fine.

I’m not using sudo in my script for any command so run

'sudo su' First before running this script.

Your default db will be 'wordpress' with user 'wpuser' and password 'wpuser123'

You can change this information in script.

Run this script either by downloading wpinstall2.sh file by using this command

wget https://github.com/MalikMaqsood/wordpress/raw/master/wpinstall2.sh

and type following command to run the script after you download the file

bash ./wpinstall.sh

or by running this script directly from github by this command

bash <(curl -Ls https://github.com/MalikMaqsood/wordpress/raw/master/wpinstall2.sh)

OR

wget -O - https://github.com/MalikMaqsood/wordpress/raw/master/wpinstall2.sh | bash

After running the script type the IP of your machine in browser and you should see WP installation setup.
