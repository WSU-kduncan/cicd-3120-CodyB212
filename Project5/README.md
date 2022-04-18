Project Overview:

This project will encapsulate filesystem packages that will be able to deliver a hosted webserver "apache" on a linux
distribution. The purpose of this project is to have small image that is able to be implemented across multiple systems, without taking
up a significant amount of disk space; in purpose to host a simple webpage!

Run Project Locally:

Docker Installation - Donwloaded Docker for Windows OS from https://docs.docker.com/desktop/windows/install/. Unfortuantely, to be able to configure docker with wsl, I had update and convert wsl to wsl2. I got the wsl2 kernal update from https://docs.microsoft.com/en-us/windows/wsl/install-manual#step-4---download-the-linux-kernel-update-package. Which I then had to run this command in the ubuntu terminal wsl --set-version Ubuntu 2. That command converted wsl to wsl 2. For future reference I used the command
wsl --set-default-version Ubuntu 2 for any future linux distrbution to be ran on wsl 2.


