#!/bin/bash
# Install Nginx if it's not already installed
if ! rpm -q nginx &> /dev/null; then
    echo "Nginx not found. Installing..."
    sudo amazon-linux-extras install nginx1 -y
else
    echo "Nginx already installed."
fi

# Clean up previous deployment directory
DEPLOY_DIR="/var/www/html"
if [ -d "$DEPLOY_DIR" ]; then
    echo "Cleaning up $DEPLOY_DIR..."
    sudo rm -rf ${DEPLOY_DIR}/*
else
    echo "Creating deployment directory $DEPLOY_DIR..."
    sudo mkdir -p $DEPLOY_DIR
    sudo chown nginx:nginx $DEPLOY_DIR # Or appropriate user/group for your web server
fi