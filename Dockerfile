FROM openjdk:8-slim

# Install Dependencies
RUN apt-get update \
    && apt-get install -y wget zip unzip \
    && mkdir -p /opt/android-sdk-linux

ENV ANDROID_HOME /opt/android-sdk-linux

COPY gradle-build /bin

# Download Android SDK tools
RUN wget -q "https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip" -O sdk-tools.zip \
    && unzip -d $ANDROID_HOME sdk-tools.zip \
    && rm sdk-tools.zip

ENV PATH $PATH:$ANDROID_HOME/tools/bin

# Install Android SDK components
RUN echo y | sdkmanager --install 'platforms;android-27' "build-tools;27.0.3" "platform-tools"
