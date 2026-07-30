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
sudo mkdir /var/www/html/redirect
sudo mkdir /var/www/html/
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
sudo cp sites/ds.conf /etc/apache2/sites-available/ -f
sudo a2ensite ds.conf
echo "127.0.0.1 ds.com" | sudo tee -a /etc/hosts
sudo cp sites/nintendods.conf /etc/apache2/sites-available/ -f
sudo a2ensite nintendods.conf
echo "127.0.0.1 nintendods.com" | sudo tee -a /etc/hosts
sudo cp sites/nintendowii.conf /etc/apache2/sites-available/ -f
sudo a2ensite nintendowii.conf
echo "127.0.0.1 nintendowii.com" | sudo tee -a /etc/hosts
sudo cp sites/wii.conf /etc/apache2/sites-available/ -f
sudo a2ensite wii.conf
echo "127.0.0.1 wii.con" | sudo tee -a /etc/hosts
sudo cp sites/gamecube.conf /etc/apache2/sites-available/ -f
sudo a2ensite gamecube.conf
echo "127.0.0.1 gamecube.com" | sudo tee -a /etc/hosts
sudo cp sites/windowsxp.conf /etc/apache2/sites-available/ -f
sudo a2ensite windowsxp.conf
echo "127.0.0.1 windowsxp.com" | sudo tee -a /etc/hosts
sudo cp sites/ipod.conf /etc/apache2/sites-available/ -f
sudo a2ensite ipod.conf
echo "127.0.0.1 ipod.com" | sudo tee -a /etc/hosts
sudo tar -xvzf www/redirect.tar.gz --overwrite -C /var/www/html/live/redirect
sudo systemctl reload apache2
sudo systemctl restart tinyproxy
