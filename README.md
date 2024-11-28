# Exodus Wallet in Kasm Workspaces

This project containerizes the Exodus Crypto Wallet for use in a Kasm Workspaces environment.

## Prerequisites

- Docker installed on your system.
- Kasm Workspaces setup.

## Building the Docker Image

To build the Docker image, you need to have the Exodus wallet Debian package. The Dockerfile is configured to accept the package name as a build argument.

1. Download the latest Exodus wallet Debian package (`.deb` file) from the official website.
2. Place the downloaded `.deb` file in the same directory as the Dockerfile.
3. Run the following command to build the Docker image:

   ```shell
   docker build --build-arg EXODUS_PACKAGE=<package-name>.deb -t kasm-exodus .
   ```

  ## Pushing the Image to a Registry
After building the image, you can push it to a Docker registry:

Tag the image with the registry's address:

```shell
docker tag kasm-exodus <registry-url>/kasm-exodus:latest
Push the image to the registry:
```

```shell
docker push <registry-url>/kasm-exodus:latest
```