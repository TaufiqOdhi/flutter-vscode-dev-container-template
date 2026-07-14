# Flutter VS Code Dev Container Template

This is a template for developing Flutter applications using a Dev Container in Visual Studio Code or running via Docker Compose.

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [Visual Studio Code](https://code.visualstudio.com/) with the [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension (if using VS Code)

## Usage

### 1. Using Visual Studio Code (Dev Container)
1. Clone this repository.
2. Open the repository in Visual Studio Code.
3. When prompted, click **"Reopen in Container"** or use the Command Palette (`Ctrl+Shift+P`) and select **"Dev Containers: Reopen in Container"**.
4. The container will automatically build and install all the necessary dependencies (Flutter SDK, Android SDK, Java, etc.).

### 2. Using Docker Compose
If you prefer not to use the Dev Containers extension or want to run the environment manually:

1. Build and start the container in the background:
   ```bash
   docker-compose up -d --build
   ```
2. Connect to the running container:
   ```bash
   docker-compose exec flutter-dev /bin/bash
   ```
3. You can create or manage your Flutter project from inside the container, and all changes will be reflected in your local `workspace/` directory.
4. To stop the container, run:
   ```bash
   docker-compose down
   ```

## Configuration

Environment variables for `FLUTTER_HOME` and `ANDROID_HOME` are dynamically loaded. You can modify these paths by editing the `.devcontainer/.env` file:
```env
FLUTTER_HOME=/home/vscode/flutter
ANDROID_HOME=/home/vscode/android-sdk
```

If you are using Docker Compose and want these build arguments to be strictly applied during the image build, run the build command with the env file:
```bash
docker-compose --env-file .devcontainer/.env up -d --build
```
