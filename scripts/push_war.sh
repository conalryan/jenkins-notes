#!/bin/bash

VERSION=$1

echo ${VERSION}
echo ${#VERSION}

URL="http://repository.mycompany.com/myapp/ROOT_$(echo ${VERSION} | xargs).war"
echo ${URL}
echo ${#URL}

curl -H "X-JFrog-Art-Api:some-api-key" -X PUT ${URL} -T /var/jenkins_home/workspace/myapp/target/*.war

