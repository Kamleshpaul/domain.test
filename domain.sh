#######################################################################################
###########           ASCII Text Art     ##########################################
#######################################################################################

echo
echo "  *********************************************************** "

echo  "\033[34m  ____  __.              .__                .__      \033[m"
echo  "\033[34m |    |/ _|____    _____ |  |   ____   _____|  |__   \033[m"
echo  "\033[34m |      < \__  \  /     \|  | _/ __ \ /  ___/  |  \  \033[m"
echo  "\033[34m |    |  \ / __ \|  Y Y  \  |_\  ___/ \___ \|   Y  \ \033[m"
echo  "\033[34m |____|__ (____  /__|_|  /____/\___  >____  >___|  / \033[m"

echo  " ****************\033[31m Run to find your own race \033[m*****************"
echo

############################################################################################3
echo
echo  "** Create local .test domain for development **\nDon't forget to give feedback on kamleshpaul414@gmail.com"
echo
############################################################################################

printf '\e[1;34m%-6s\e[m' "Enter your email : "
read email
while [ -z ${email} ]; do
	  printf '\e[1;34m%-6s\e[m' "Email is Required : "
    read email
done

printf '\e[1;34m%-6s\e[m' "Enter your domain name it will add .test automatically : "
read domainName
while [ -z ${domainName} ]; do
	  printf '\e[1;34m%-6s\e[m' "Domain name is Required : "
    read domainName
done

printf '\e[1;34m%-6s\e[m' "Enter your project path : "
read projectPath
while [ -z ${projectPath} ]; do
	  printf '\e[1;34m%-6s\e[m' "Project path name is Required : "
    read projectPath
done


touch /etc/apache2/sites-available/$domainName.conf

cat > /etc/apache2/sites-available/$domainName.conf << EOF

<VirtualHost *:80>

ServerAdmin $email
ServerName $domainName.test
DocumentRoot $projectPath

ErrorLog /var/log/apache2/examplerror.log
CustomLog /var/log/apache2/example-access.log combined

</VirtualHost>

EOF


echo "127.0.1.1 $domainName.test" >> /etc/hosts

a2ensite $domainName.conf enable
service apache2 restart

echo  "\033[31m  $domainName.test   created \033[m"
