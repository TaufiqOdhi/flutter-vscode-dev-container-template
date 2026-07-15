# Use the official Microsoft Ubuntu base image
FROM mcr.microsoft.com/devcontainers/base:ubuntu

ENV USER_HOME=${USER_HOME:-/home/vscode} \
    FLUTTER_HOME=${FLUTTER_HOME:-${USER_HOME}/flutter} \
    ANDROID_HOME=${ANDROID_HOME:-${USER_HOME}/android-sdk} \
    PATH=${PATH}:${FLUTTER_HOME}/bin:${ANDROID_HOME}/cmdline-tools/latest/bin:${ANDROID_HOME}/platform-tools:${USER_HOME}/.local/bin

# Install dependencies, Java 17, and basic tools
RUN apt update && export DEBIAN_FRONTEND=noninteractive \
    && apt install -y curl git unzip xz-utils zip libglu1-mesa openjdk-17-jdk wget \
    && rm -rf /var/lib/apt/lists/*

# Switch to the non-root user provided by the base image
USER vscode
WORKDIR ${USER_HOME}/workspace
