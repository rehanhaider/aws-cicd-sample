#!/bin/bash
DEPLOY_DIR="/var/www/html"
echo "Setting permissions for $DEPLOY_DIR..."
sudo chown -R nginx:nginx $DEPLOY_DIR # Or appropriate user/group
sudo chmod -R 755 $DEPLOY_DIR
