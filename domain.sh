echo "let's rock and role";


read -p "Enter your email: "  email
read -p "Enter your host file name: "  domainName
read -p "Enter your project path"  projectPath

touch /etc/apache2/sites-available/$domainName.conf

cat > /etc/apache2/sites-available/$domainName.conf << EOF

<VirtualHost *:80>

ServerAdmin $email
ServerName $domainName.test
DocumentRoot $projectPath

ErrorLog /var/log/apache2/example-error.log
CustomLog /var/log/apache2/example-access.log combined

</VirtualHost>

EOF


echo "127.0.1.1 $domainName.test" >> /etc/hosts

a2ensite $domainName.conf enable

service apache2 restart
