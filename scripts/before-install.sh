#!/bin/bash

set -e

echo "Installing Nginx if not present..."
if ! rpm -q nginx &> /dev/null; then
    sudo amazon-linux-extras install nginx1 -y
else
    echo "Nginx already installed."
fi

DEPLOY_DIR="/var/www/html"

echo "Ensuring $DEPLOY_DIR exists..."
sudo mkdir -p $DEPLOY_DIR
sudo chown nginx:nginx $DEPLOY_DIR

NGINX_CONF="/etc/nginx/conf.d/default.conf"

echo "Configuring Nginx to serve from $DEPLOY_DIR..."

sudo tee $NGINX_CONF > /dev/null <<EOF
server {
    listen       80;
    server_name  localhost;

    location / {
        root   $DEPLOY_DIR;
        index  index.html index.htm;
    }

    error_page  404              /404.html;

    location = /40x.html {
    }

    error_page   500 502 503 504  /50x.html;

    location = /50x.html {
    }
}
EOF

echo "Restarting Nginx to apply config changes..."
sudo systemctl restart nginx
sudo systemctl enable nginx