#!/bin/bash

sudo yum update
sudo yum -y install httpd
sudo systemctl start httpd && sudo systemctl enable httpd

echo ?Hello Brittany H. i see YOU! from $(hostname -f)? > /var/www/html/index.html