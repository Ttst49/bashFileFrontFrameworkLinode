imcd
sudo apt update && sudo apt upgrade -y
apt install apache2 -y
ufw allow "Apache"
ufw allow "Apache Full"
ufw allow "OpenSSH"
yes | sudo ufw enable
sudo apt install neovim -y
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
source ~/.bashrc
nvm install v20.11.0
cd /etc/apache2/sites-available/
printf "<VirtualHost *:80>
        ServerAdmin thibautstachnick@gmail.com
        ServerName angularReactVue.example.com
        DocumentRoot /home/project/dist/

        <Directory "/home/project/dist/">
        FallbackResource ./index.html
        Options Indexes FollowSymLinks
        AllowOverride None
        Require all granted
        </Directory>

        
        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined

        
RewriteEngine On
RewriteCond %{DOCUMENT_ROOT}%{REQUEST_URI} -f [OR]
RewriteCond %{DOCUMENT_ROOT}%{REQUEST_URI} -d
RewriteRule ^ - [L]

RewriteRule ^ /index.html
</VirtualHost>" > frontFramework.conf
snap install certbot --classic
