#!/bin/bash
sudo apt update
sudo apt install tinyproxy -y
sudo apt install apache2 -y
sudo ufw allow 8888/tcp
sudo cp tinyproxy/tinyproxy.conf /etc/tinyproxy -f
sudo cp tinyproxy/filter /etc/tinyproxy -f
sudo tar -xvzf www/front.tar.gz --overwrite -C /var/www/html
sudo mkdir /var/www/html/com
sudo mkdir /var/www/html/live
sudo mkdir /var/www/html/restore
sudo cp sites/com.conf /etc/apache2/sites-available/ -f
sudo a2ensite com.conf
echo "127.0.0.1 com.net" | sudo tee -a /etc/hosts
sudo tar -xvzf www/com.tar.gz --overwrite -C /var/www/html/com
sudo mkdir /var/www/html/com/pub
sudo mkdir /var/www/html/restore/nintendo
sudo cp sites/nintendo.conf /etc/apache2/sites-available/ -f
sudo a2ensite nintendo.conf
echo "127.0.0.1 nintendo.net" | sudo tee -a /etc/hosts
sudo tar -xvzf www/restore/nintendo.tar.gz --overwrite -C /var/www/html/restore/nintendo
sudo systemctl reload apache2
sudo systemctl restart tinyproxy
