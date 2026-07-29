#!/bin/bash
sudo apt update
sudo apt install tinyproxy -y
sudo apt install apache2 -y
sudo ufw allow 8888/tcp
sudo ufw allow 5190/tcp
sudo ufw allow 1863/tcp
sudo ufw allow 1864/tcp
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
echo "127.0.0.1 nintendo.com" | sudo tee -a /etc/hosts
sudo tar -xvzf www/restore/nintendo.tar.gz --overwrite -C /var/www/html/restore/nintendo
sudo mkdir /var/www/html/restore/apple
sudo cp sites/apple.conf /etc/apache2/sites-available/ -f
sudo a2ensite apple.conf
echo "127.0.0.1 apple.com" | sudo tee -a /etc/hosts
sudo tar -xvzf www/restore/apple.tar.gz --overwrite -C /var/www/html/restore/apple
sudo mkdir /var/www/html/restore/microsoft
sudo cp sites/microsoft.conf /etc/apache2/sites-available/ -f
sudo a2ensite microsoft.conf
echo "127.0.0.1 microsoft.com" | sudo tee -a /etc/hosts
sudo tar -xvzf www/restore/microsoft.tar.gz --overwrite -C /var/www/html/restore/microsoft
sudo mkdir /var/www/html/restore/msn
sudo cp sites/msn.conf /etc/apache2/sites-available/ -f
sudo a2ensite msn.conf
echo "127.0.0.1 msn.com" | sudo tee -a /etc/hosts
sudo tar -xvzf www/restore/msn.tar.gz --overwrite -C /var/www/html/restore/msn
sudo mkdir /var/www/html/restore/cartoonnetwork
sudo cp sites/cartoonnetwork.conf /etc/apache2/sites-available/ -f
sudo a2ensite cartoonnetwork.conf
echo "127.0.0.1 cartoonnetwork.com" | sudo tee -a /etc/hosts
sudo tar -xvzf www/restore/cartoonnetwork.tar.gz --overwrite -C /var/www/html/restore/cartoonnetwork
sudo mkdir /var/www/html/live/headlines
sudo cp sites/headlines.conf /etc/apache2/sites-available/ -f
sudo a2ensite headlines.conf
echo "127.0.0.1 headlines.net" | sudo tee -a /etc/hosts
sudo tar -xvzf www/headlines.tar.gz --overwrite -C /var/www/html/live/headlines
sudo mkdir /var/www/html/live/time
sudo cp sites/time.conf /etc/apache2/sites-available/ -f
sudo a2ensite time.conf
echo "127.0.0.1 time.net" | sudo tee -a /etc/hosts
sudo tar -xvzf www/time.tar.gz --overwrite -C /var/www/html/live/time
sudo mkdir /var/www/html/live/forecast
sudo cp sites/forecast.conf /etc/apache2/sites-available/ -f
sudo a2ensite forecast.conf
echo "127.0.0.1 forecast.net" | sudo tee -a /etc/hosts
sudo tar -xvzf www/forecast.tar.gz --overwrite -C /var/www/html/live/forecast
sudo systemctl reload apache2
sudo systemctl restart tinyproxy
