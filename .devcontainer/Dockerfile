# Use the official Microsoft Ubuntu base image
FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Set environment variables for Android and Flutter
ENV FLUTTER_HOME=/opt/flutter \
    ANDROID_HOME=/opt/android-sdk \
    PATH=${PATH}:/opt/flutter/bin:/opt/android-sdk/cmdline-tools/latest/bin:/opt/android-sdk/platform-tools

# Install dependencies, Java 17, and basic tools
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y curl git unzip xz-utils zip libglu1-mesa openjdk-17-jdk wget \
    && rm -rf /var/lib/apt/lists/*

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

# Fix permissions so the default 'vscode' user can access the SDKs
RUN chown -R vscode:vscode ${FLUTTER_HOME} ${ANDROID_HOME}

# Switch to the non-root user provided by the base image
USER vscode
WORKDIR /workspace

# Disable analytics and precache Flutter artifacts
RUN flutter config --no-analytics && \
    flutter precache