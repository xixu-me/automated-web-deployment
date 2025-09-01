# X-WebUI

A comprehensive setup script for deploying a secure server environment with Nginx, Docker, X, and Open WebUI.

## Overview

This repository contains a bash script that automates the setup of a complete server environment on a Debian system. The script sets up:

- Nginx web server
- SSL/TLS certificates via acme.sh
- Docker and Docker Compose
- Open WebUI (running in Docker)
- X proxy server with secure configuration
- Automatic certificate renewal

## Requirements

- Debian 10+ 64-bit system
- Sudo privileges
- Domain name pointing to your server
- Inbound traffic on TCP ports 80 and 443 from 0.0.0.0/0 allowed

## Usage

Log in as a non-root user and update your system:

```bash
sudo apt update && sudo apt upgrade -y
```

Run the script:

```bash
curl -L https://github.com/xixu-me/X-WebUI/raw/main/setup.sh | bash -s <username> <domain> <id>
```

Replace the following:

- `<username>`: Your login username
- `<domain>`: Your domain name (must be pointed to this server)
- `<id>`: A unique ID for the X configuration

If you encounter the following error:

```bash
bash: curl: command not found
```

Please install `curl` and `bash` first:

```bash
sudo apt update && sudo apt install -y curl bash
```

## Features

### Web Server

- Configures Nginx
- Sets up automatic HTTPS redirection
- Implements proper security headers

### SSL/TLS Certificates

- Automatically obtains and configures Let's Encrypt certificates
- Sets up automatic renewal via cron job

### Docker Environment

- Installs Docker and Docker Compose
- Configures Open WebUI in a Docker container
- Sets up proper restart policies

### Proxy Configuration

- Installs and configures X
- Implements secure TLS settings
- Configures proper routing rules

## Security Considerations

This script implements several security best practices:

- Uses TLS 1.2+ for all connections
- Implements proper certificate handling
- Configures firewall rules to block unwanted traffic
- Sets up proper user permissions

## Disclaimer

1. This repository is strictly for educational and research purposes.
2. Use at your own risk. The repository assumes no responsibility for potential issues.
3. No guarantee of accuracy, completeness, or reliability.
4. Not liable for data loss or damages.
5. Ensure compliance with relevant licenses and legal regulations.
6. No endorsement of third-party hardware/software.
7. User modifications are their own responsibility.
8. Terms may change at any time. By using this repository, you agree to these terms.

## License

Copyright &copy; [Xi Xu](https://xi-xu.me). All rights reserved.

Licensed under the [GPL-3.0](LICENSE) license.  
