# [jenkins](https://jenkins.io/doc/tutorials/)

# Run Jenkins in Docker
- In this tutorial, you’ll be running Jenkins as a Docker container from the jenkinsci/blueocean Docker image.
- Run the jenkinsci/blueocean image as a container in Docker, this command automatically downloads the image if this hasn’t been done or updates the jenkinsci/blueocean Docker image, if an updated one is available.
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
Note:
```bash
-v /var/run/docker.sock:/var/run/docker.sock \
```
- Map the /var/jenkins_home directory in the container to the Docker volume with the name jenkins-data on the host machine.
- If this volume does not exist on the host machine, then this docker run command will automatically create the volume for you.
```bash
-v "$HOME":/home \ 
```
- Map the $HOME directory on the host (i.e. your local) machine (usually the /Users/<your-username> directory) to the /home directory in the container
```bash
docker exec -it jenkins-tutorials bash
```
- Access Jenkins/Blue Ocean Docker container through terminal using docker exec commands add --name flag

# Jenkinsfile Java
- Create a Jenkinsfile in the route of SCM
```
pipeline {
    agent {
        docker {
            image 'maven:3-alpine' 
            args '-v /root/.m2:/root/.m2' 
        }
    }
    stages {
        stage('Build') { 
            steps {
                sh 'mvn -B -DskipTests clean package' 
            }
        }
    }
}
```
- The **image** parameter (of the agent section’s docker parameter) downloads the maven:3-apline Docker image (if it’s not already available on your machine) and runs this image as a separate container. This means that:
- You’ll have separate Jenkins and Maven containers running locally in Docker.
- The Maven container becomes the agent that Jenkins uses to run your Pipeline project. However, this container is short-lived - its lifespan is only that of the duration of your Pipeline’s execution.
- The **args** parameter creates a reciprocal mapping between the /root/.m2 (i.e. Maven repository) directories in the short-lived Maven Docker container and that of your Docker host’s filesystem. 
- This is to ensure that the artifacts necessary to build your Java application (which Maven downloads while your Pipeline is being executed) are retained in the Maven repository beyond the lifespan of the Maven container. 
- This prevents Maven from having to download the same artifacts during successive runs of your Jenkins Pipeline, which you’ll be conducting later on. 
- Be aware that unlike the Docker data volume you created for jenkins-data above, the Docker host’s filesystem is effectively cleared out each time Docker is restarted. This means you’ll lose the downloaded Maven repository artifacts each time Docker restarts.
- Defines a stage (directive) called Build that appears on the Jenkins UI.
- This sh step (of the steps section) runs the Maven command to cleanly build your Java application (without running any tests).
