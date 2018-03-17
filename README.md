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
        volumes:
          - "./jenkins_home:/var/jenkins_home"
          - "./:/mnt"


    Create a directory (that holds Jenkins configurations) and add it to your local .gitignore

    mkdir jenkins_home

    docker-compose up -d

    cat jenkins_home/secrets/initialSecret

    Set up a project

    Pipeline

    Git repository location: file:////mnt/
    
    Change the branch on Jenkins to the one you are developing currently i.e. */mybranch

Build instructions
------------------

    docker login --username=phzfi
    docker build .
    docker tag abcdef123 phzfi/jenkins"
    docker push phzfi/jenkins
