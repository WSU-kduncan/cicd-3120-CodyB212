#!/bin/sh
sudo docker stop cody
sudo docker system prune -f -a

sudo docker pull cody212/codyproject

sudo docker run -d --name cody -p 80:80 cody212/codyproject
