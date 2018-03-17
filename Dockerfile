FROM jenkins/jenkins:lts
# if we want to install via apt
USER root
RUN apt-get update && \
apt-get install -y sudo nano && \
usermod -g sudo jenkins && \
echo "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# drop back to the regular jenkins user - good practice
USER jenkins
