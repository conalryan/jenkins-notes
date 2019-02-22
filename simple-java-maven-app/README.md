# simple-java-maven-app

This repository is for the
[Build a Java app with Maven](https://jenkins.io/doc/tutorials/build-a-java-app-with-maven/)
tutorial in the [Jenkins User Documentation](https://jenkins.io/doc/).

The repository contains a simple Java application which outputs the string
"Hello world!" and is accompanied by a couple of unit tests to check that the
main application works as expected. The results of these tests are saved to a
JUnit XML report.

The `jenkins` directory contains an example of the `Jenkinsfile` (i.e. Pipeline)
you'll be creating yourself during the tutorial and the `scripts` subdirectory
contains a shell script with commands that are executed when Jenkins processes
the "Deliver" stage of your Pipeline.

# Run

-  ```-v /var/run/docker.sock:/var/run/docker.sock```
```bash
docker run \
  --rm \
  -u root \
  -p 8080:8080 \
  --name jenkins-tutorials \
  -v jenkins-data:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v "$HOME":/home \
  jenkinsci/blueocean
```
ERROR: 
```+ docker -v /var/jenkins_home/workspace/simple-java-maven-app@tmp/durable-3965dbc6/script.sh: line 1: docker: not found```

- ```-v $(which docker):/usr/bin/docker -v /var/run/docker.sock:/var/run/docker.sock \```
```bash
docker run \
  --rm \
  -u root \
  -p 8080:8080 \
  -v jenkins-data:/var/jenkins_home \
  -v $(which docker):/usr/bin/docker \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v "$HOME":/home \
  jenkinsci/blueocean
```
SUCCESS: ```+ docker -v
Docker version 18.09.2, build 6247962```
