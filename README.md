# KASM Exodus Wallet Workspace
[![Docker Pulls](https://img.shields.io/docker/pulls/williamsct1/kasm-exodus)](https://hub.docker.com/r/williamsct1/kasm-exodus)
[![Docker Image Size](https://img.shields.io/docker/image-size/williamsct1/kasm-exodus/latest)](https://hub.docker.com/r/williamsct1/kasm-exodus)
[![Docker Image Version](https://img.shields.io/docker/v/williamsct1/kasm-exodus/latest)](https://hub.docker.com/r/williamsct1/kasm-exodus/tags)

## Container Registry
The pre-built container image is available on Docker Hub:
- [williamsct1/kasm-exodus](https://hub.docker.com/r/williamsct1/kasm-exodus)
- Latest version: `docker pull williamsct1/kasm-exodus:latest`

## Description
This project provides a custom KASM workspace for running the Exodus Crypto Wallet in a containerized environment. It offers a secure, isolated environment for managing your cryptocurrency assets through a web browser.

## Why Use KASM for Exodus Wallet?
### Secure Cryptocurrency Management
- Isolated environment for crypto transactions
- Access your wallet remotely through a web browser
- Enhanced security through containerization

### Convenient Web Access
- Access your crypto wallet from any browser
- No local installation required
- Consistent environment across different machines

## Features
- Full Exodus Wallet functionality
- Secure, containerized environment
- Web-based access through KASM
- Persistent storage for wallet data
- Custom background image

## Quick Start: Using Pre-built Image
### Prerequisites
- A running KASM Workspaces installation
- Admin access to your KASM Workspaces instance

### Installation Steps
1. Log into your KASM Workspaces admin interface
2. Navigate to Workspaces
   - Click on "Workspaces" in the left sidebar
   - Click the "Add Workspace" button
3. Configure the New Workspace Details
   - **Workspace Type**: Container
   - **Friendly Name**: Exodus Wallet
   - **Description**: Secure cryptocurrency wallet environment
   - **Docker Image**: williamsct1/kasm-exodus:latest
   - **Docker Registry**: https://index.docker.io/v1/
   - **Persistent Profile Path**: `/mnt/kasm_profiles/{image_id}/{user_id}`
   - Click "Save"

## Building Your Own Image
### Prerequisites
- Docker installed on your system
- Git for cloning the repository

### Building Steps
1. Download the latest Exodus wallet Debian package (`.deb` file) from the official website
2. Place the downloaded `.deb` file in the same directory as the Dockerfile
3. Build the Docker image:
```bash
docker build --build-arg EXODUS_PACKAGE=<package-name>.deb -t YOURUSER/kasm-exodus:latest .
```

## Pushing to Registry
```bash
docker tag YOURUSER/kasm-exodus:latest <registry-url>/kasm-exodus:latest
docker push <registry-url>/kasm-exodus:latest
```

## Troubleshooting
### Common Issues
- If wallet data is not persisting:
  1. Verify persistent storage is properly configured
  2. Check permissions on the storage directory
- If wallet interface is not loading:
  1. Ensure proper network connectivity
  2. Verify system requirements are met

## Notes
- The workspace uses persistent storage for wallet data
- Ensure secure backup of wallet information
- Regular updates recommended for security

## License
This project is licensed under the [MIT License](LICENSE) - see the LICENSE file for details.

## Acknowledgments
- [Exodus Wallet](https://www.exodus.com/) - Cryptocurrency Wallet
- [KASM Workspaces](https://www.kasmweb.com/) - Base container images

