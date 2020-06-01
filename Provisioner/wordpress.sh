#!/bin/bash

sudo yum update -yum
sudo yum install -y httpd php php-myql wget
sudo systemctl start httpd
sudo systemctl enable httpd
sudo wget http://wordpress.org/latest.tar.gz
sudo tar xzvf latest.tar.gz
cp -rf Wordpress/* /var/www/html