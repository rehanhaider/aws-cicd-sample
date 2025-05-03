#!/bin/bash
echo "Ensuring Nginx service is started and enabled..."
sudo systemctl enable nginx
sudo systemctl start nginx
sudo systemctl status nginx # Optional: check status
