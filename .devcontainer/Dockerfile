# Use the official Microsoft Ubuntu base image
FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Set environment variables for Android and Flutter
ARG FLUTTER_HOME=/home/vscode/flutter
ARG ANDROID_HOME=/home/vscode/android-sdk

ENV FLUTTER_HOME=${FLUTTER_HOME} \
    ANDROID_HOME=${ANDROID_HOME} \
    PATH=${PATH}:${FLUTTER_HOME}/bin:${ANDROID_HOME}/cmdline-tools/latest/bin:${ANDROID_HOME}/platform-tools

# Install dependencies, Java 17, and basic tools
RUN apt update && export DEBIAN_FRONTEND=noninteractive \
    && apt install -y curl git unzip xz-utils zip libglu1-mesa openjdk-17-jdk wget \
    && rm -rf /var/lib/apt/lists/*

# Switch to the non-root user provided by the base image
USER vscode
WORKDIR /home/vscode/workspace

# Install Android SDK Command-line Tools
RUN mkdir -p ${ANDROID_HOME}/cmdline-tools && \
    wget -q https://dl.google.com/android/repository/commandlinetools-linux-11479570_latest.zip -O /tmp/cmdline-tools.zip && \
    unzip -q /tmp/cmdline-tools.zip -d ${ANDROID_HOME}/cmdline-tools && \
    mv ${ANDROID_HOME}/cmdline-tools/cmdline-tools ${ANDROID_HOME}/cmdline-tools/latest && \
    rm /tmp/cmdline-tools.zip

# Accept Android licenses and install essential SDK components
RUN yes | sdkmanager --licenses && \
    sdkmanager "platform-tools" "platforms;android-36" "build-tools;28.0.3" "ndk;25.1.8937393" "cmake;3.22.1"

# Install Flutter SDK (Stable channel)
RUN git clone https://github.com/flutter/flutter.git -b stable ${FLUTTER_HOME}

# Disable analytics and precache Flutter artifacts
RUN flutter config --no-analytics && \
    flutter precache