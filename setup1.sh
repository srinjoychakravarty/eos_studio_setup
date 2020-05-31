#!/bin/bash
echo "This script is made for Debian/Ubuntu sytems only. Are you running Debian/Ubuntu?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) sudo apt update && sudo apt upgrade && sudo apt dist-upgrade && sudo apt autoremove && sudo apt autoclean; break;;
        No ) exit 1;;
    esac
done
echo "Stop and remove all containers and images to upgrade Docker version? [recommended]"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) docker system prune -a; break;;
        No ) exit;;
    esac
done
echo "Uninstall previous versions of Docker? [recommended]"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) sudo apt-get purge -y docker-engine docker docker.io docker-ce docker-ce-cli && sudo apt-get autoremove -y --purge docker-engine docker docker.io docker-ce && sudo rm -rf /etc/docker; break;;
        No ) exit;;
    esac
done
echo "Install Docker required to start local EOS node? [recommended]"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y; break;;
        No ) exit;;
    esac
done
sudo apt install git -y
echo "Installed Docker prerequisites successfully!"
echo "Adding Docker’s official GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
echo "Adding Docker's stable repository..."
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
echo "Installing latest Docker Engine..."
sudo apt-get install docker-ce docker-ce-cli containerd.io
echo "Configuring Docker to be used as non-root user.."
sudo usermod -aG docker $USER
echo "System needs to reboot...Please run setup2.sh after restart! [recommended]"
select yn in "Yes" "No"; do
    case $yn in
    	Yes ) sudo reboot; break;;
        No ) exit;;
    esac
done
