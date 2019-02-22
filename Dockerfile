FROM ubuntu

USER root

# Tools
RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y wget

# Install Git
RUN apt-get install -y git
RUN which git
RUN git --version

# Install Java
# RUN apt-get install default-jdk

# Install Java 11 Manual
# https://www.javahelps.com/2015/03/install-oracle-jdk-in-ubuntu.html
# RUN mkdir /usr/dl
# RUN wget -O /usr/dl/openjdk-11.0.2_linux-x64_bin.tar.gz https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_linux-x64_bin.tar.gz
# RUN mkdir /usr/lib/jvm
# RUN tar -xvzf /usr/dl/openjdk-11.0.2_linux-x64_bin.tar.gz -C /usr/lib/jvm

# ENV JAVA_HOME /usr/lib/jvm/jdk-11.0.2
# ENV PATH $PATH:/usr/lib/jvm/jdk-11.0.2/bin
# RUN echo $JAVA_HOME && echo $PATH

# RUN update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk-11.0.2/bin/java" 0
# RUN update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk-11.0.2/bin/javac" 0
# RUN update-alternatives --set java /usr/lib/jvm/jdk-11.0.2/bin/java
# RUN update-alternatives --set javac /usr/lib/jvm/jdk-11.0.2/bin/javac
# RUN update-alternatives --list java
# RUN update-alternatives --list javac

# RUN java -version

# Install Java jdk 8
RUN apt-get install -y openjdk-8-jdk
RUN echo $JAVA_HOME && echo $PATH
RUN java -version

# Install Maven Manual 3.2.3
# https://www.javahelps.com/2017/10/install-apache-maven-on-linux.html
RUN mkdir /usr/dl
RUN wget -O /usr/dl/apache-maven-3.2.3-bin.tar.gz https://archive.apache.org/dist/maven/maven-3/3.2.3/binaries/apache-maven-3.2.3-bin.tar.gz
RUN tar -xvzf /usr/dl/apache-maven-3.2.3-bin.tar.gz -C /opt

ENV M2_HOME /opt/apache-maven-3.2.3
ENV PATH $PATH:/opt/apache-maven-3.2.3/bin
RUN echo $M2_HOME && echo $PATH

RUN update-alternatives --install "/usr/bin/mvn" "mvn" "/opt/apache-maven-3.2.3/bin/mvn" 0
RUN update-alternatives --set mvn /opt/apache-maven-3.2.3/bin/mvn

RUN mvn --version

# Install Node
RUN apt-get install -y nodejs
RUN node -v

# Install NPM
RUN apt-get install -y npm
RUN npm -v

# Install Google Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
RUN apt-get update && apt-get -y install google-chrome-stable

# Install Sonar scanner
RUN wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.2.0.1227-linux.zip
RUN apt-get update && apt-get install unzip
RUN unzip sonar-scanner-cli-3.2.0.1227-linux.zip && mv sonar-scanner-3.2.0.1227-linux sonar-scanner

# Install Go
RUN apt-get install -y golang-go
RUN go version