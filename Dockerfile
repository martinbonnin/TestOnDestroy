FROM ubuntu:18.04

# Install Dependencies
RUN apt-get update

RUN apt-get install -y git wget unzip

# Download JDK 8
RUN wget -q "https://edelivery.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/jdk-8u181-linux-x64.tar.gz"    --header "Cookie: oraclelicense=accept-securebackup-cookie" -O jdk8.tar.gz

RUN tar -xzf jdk8.tar.gz -C /opt 

RUN rm jdk8.tar.gz

# Configure Java Environment
# ENV JAVA7_HOME /opt/jdk1.7.0_79
ENV JAVA_HOME /opt/jdk1.8.0_181
ENV PATH $PATH:$JAVA_HOME/bin

ENV ANDROID_HOME /opt/android-sdk-linux

# Download Android SDK tools
RUN wget -q "https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip" -O sdk-tools.zip
RUN unzip -d $ANDROID_HOME sdk-tools.zip
RUN rm sdk-tools.zip

ENV PATH $PATH:$ANDROID_HOME/tools/bin

# Install Android SDK components
RUN echo y | sdkmanager --install 'platforms;android-27'

ENTRYPOINT cat /proc/cpuinfo
