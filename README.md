Project Overview:

This project will encapsulate filesystem packages that will be able to deliver a hosted webserver "apache" on a linux
distribution. The purpose of this project is to have a small image that is able to be implemented across multiple systems, without taking
up a significant amount of disk space; in purpose to host a simple webpage!

Part 1 - Dockerize it
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Run Project Locally:

Docker Installation - Downloaded Docker for Windows OS from https://docs.docker.com/desktop/windows/install/. Unfortuantely, to be able to configure docker with wsl, I had update and convert wsl to wsl2. I got the wsl2 kernal update from https://docs.microsoft.com/en-us/windows/wsl/install-manual#step-4---download-the-linux-kernel-update-package. Which I then had to run this command in the ubuntu terminal wsl --set-version Ubuntu 2. That command converted wsl to wsl 2. For future reference I used the command
wsl --set-default-version Ubuntu 2 for any future linux distrbution to be ran on wsl 2.

How to Build the Container - I had to docker pull httpd, which is an image that has apache2 pre-installed; rather than pulling ubuntu and installing apache2. I used my  repos's directory /cicd-3120-CodyB212 that would consist of my projects content. Now that I had a directory made I then added my html template "website.html", along with a Dockerfile. The Dockerfile serves as a recipe for the implementation of a container you are wanting to build. my Dockerfile consists of using the base image httpd:2.4 (FROM httpd:2.4), copying my files from my host system to the container (COPY . /cicd-3120-CodyB212* /usr/local/apache2/htdocs/), and running three commands  (RUN cd htdocs && rm index.html && cp website.html index.html) in which changes to the directory that has the index.html template and removes that default template, then copies my html file into a index.html, therefore apache is configured to display the index.html template. Finally, had to run docker build -t project5 . This command will build the container and tag it with project5.

How to Run the Container - To run the container, use the command: docker run -d -p 8080:80 project5. This command will detach and run in the background, while opening and listening to port 8080 on the host system and port 80 for the container.

How to View the Project - To view the website being hosted. You will need to open a browser and type in localhost:8080 to be able to view the webpage.

Part 2: GitHub Actions and DockerHub
------------------------------------------------------------------------------------------------------------------------------------------------------------------
Creating DockerHub Public Repo - Created by going to hub.docker.com. I pressed create -> Named my repo codyproject -> Desription: Project 5 -> Create.

How to Authenticate - I had to go to my account settings and create a new access token. This allowed me to give read, write, and delete permissions with this token. I ended up saving this token onto my Windows system. Then had to go into my wsl2 docker login -u cody212 and then paste the token into the password credentials. This then allows me to build my image and then docker push cody212/codyproject to my public repo! If I wanted I could also docker pull cody212/codyproject if needed.

Configuring GitHub Secrets - These secrets come into play when configuring your workflow actions. To create them you will need to go to your github repo ->
Settings -> Actions -> New Repo Secret. This page will prompt you to make a secret! I made two secrets, one being DOCKER_USERNAME with the value of my username and a second secret being my DOCKER_TOKEN with the value of your Dockerhub token.

Behavior of GitHub Workflow - The workflow is designed to use your Github Repo and use actions to autonomously build and push your container image to DockerHub when triggered. This workflow is triggered once you make a push to the repo.

Part 3: Deployment
------------------------------------------------------------------------------------------------------------------------------------------------------------------
Container Restart Script - This script is configured to restart, meaning that everytime there is a new system running this container image or the image is just frequently pulled, it will stop my old image from running, clear any non-active containers, pull my script, then correctly bind run my container in the background detached.

Webhook Task Definition File - This file is designed to reiterate webhook, meaning this file will with execute relative to my webhook.

Setting Up a Webhook on the server - On Dockerhub, I created a webhook that will listen on port 9000 http://18.205.222.246:9000/hooks/redeploy. I installed Go, had to end up creating the webhook.service file, thankfully I didn't have to unmask the file. I then ran sudo systemctl enable wehook.service, which gave me no problems. When I end up commiting and pushing to my github, github updates, along with my DockerHub. Finally, 18.205.222.246:9000/hooks/redeploy displays my website content.
