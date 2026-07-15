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
