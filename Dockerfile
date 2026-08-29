# Use the official Microsoft Ubuntu base image
FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Install dependencies, Java 17, and basic tools
RUN apt update && export DEBIAN_FRONTEND=noninteractive \
    && apt install -y curl git unzip xz-utils zip libglu1-mesa openjdk-17-jdk wget \
    && rm -rf /var/lib/apt/lists/*

# Switch to the non-root user provided by the base image
USER vscode

# install npm and vercel cli
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
RUN bash -c "source ~/.nvm/nvm.sh && nvm install --lts && npm install -g vercel"

# Install code-server for web-based IDE access
RUN curl -fsSL https://code-server.dev/install.sh | sh

WORKDIR /home/vscode
