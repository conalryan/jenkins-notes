FROM ubuntu

USER root

RUN apt-get update \
  && apt-get install -y wget

# Java 8 apk
#RUN apk fetch openjdk8
#RUN apk add openjdk8
#RUN java -version
#RUN echo $JAVA_HOME

# Java 11 wget
RUN mkdir /usr/dl
RUN wget -O /usr/dl/openjdk-11.0.2_linux-x64_bin.tar.gz https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_linux-x64_bin.tar.gz
RUN mkdir /usr/lib/jvm
RUN tar -xvzf /usr/dl/openjdk-11.0.2_linux-x64_bin.tar.gz -C /usr/lib/jvm

ENV JAVA_HOME /usr/lib/jvm/jdk-11.0.2
ENV PATH $PATH:/usr/lib/jvm/jdk-11.0.2/bin

RUN echo $JAVA_HOME && \
    echo $PATH

RUN update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk-11.0.2/bin/java" 0
RUN update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk-11.0.2/bin/javac" 0
RUN update-alternatives --set java /usr/lib/jvm/jdk-11.0.2/bin/java
RUN update-alternatives --set javac /usr/lib/jvm/jdk-11.0.2/bin/javac

RUN update-alternatives --list java
RUN update-alternatives --list javac

RUN java -version