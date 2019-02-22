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
- Map the /var/jenkins_home directory in the container to the Docker volume with the name jenkins-data on the host machine.
- If this volume does not exist on the host machine, then this docker run command will automatically create the volume for you.
```bash
-v /var/run/docker.sock:/var/run/docker.sock \
```
- Map the $HOME directory on the host (i.e. your local) machine (usually the /Users/<your-username> directory) to the /home directory in the container
```bash
-v "$HOME":/home \ 
```
- Access Jenkins/Blue Ocean Docker container through terminal using docker exec commands add --name flag
```bash
docker exec -it jenkins-tutorials bash
```
