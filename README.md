Description
-----------
Local Jenkins development environment based on docker.

See Docker Hub: https://hub.docker.com/r/phzfi/jenkins/

Requirements
------------
    Docker
    docker-compose

Usage instructions
------------------
    Create a docker-compose.yml like this:

    version: '2'
    services:
      jenkins:
        image: phzfi/jenkins
        ports: 
          - "8888:8080"
          - "50000:50000"
        volumes:
          - "./jenkins_home:/var/jenkins_home"
          - "./:/mnt/workspace"


    Create a directory (that holds Jenkins configurations) and add it to your local .gitignore

    mkdir jenkins_home

    docker-compose up -d

    cat jenkins_home/secrets/initialSecret

    Set up a project

    Pipeline

    Git repository location: file:////mnt/
    
    Change the branch on Jenkins to the one you are developing currently i.e. */mybranch

Setting up JLNP Slave Node
--------------------------
    For example for vagrant environments, you can't run them inside docker, so we need to setup
    a slave executor on the host. Maybe the easiest way is to use JLNP protocol.

    First add a node by go to 
    Manage Jenkins->Manage Nodes->New Node
    * Name: localhost
    * Permanent Agent
    Then
    * Launch method: Launch agent via Java Web Start

    You need to create a user on the host machine that has sudo rights

    sudo su
    useradd jenkins
    usermod -g sudo jenkins
    echo "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
    mkdir /home/jenkins
    chown jenkins /home/jenkins

    Then launch JLNP agent as user jenkins
    su jenkins
    cd ~
    wget http://localhost:8888/jnlpJars/agent.jar
    java -jar agent.jar -jnlpUrl http://localhost:8888/computer/localhost/slave-agent.jnlp -workDir "/home/phz/workspace/"

Build instructions
------------------

    docker login --username=phzfi
    docker build .
    docker tag abcdef123 phzfi/jenkins"
    docker push phzfi/jenkins

Things
------
    
