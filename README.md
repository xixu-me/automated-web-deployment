# AWSDS - Automated Web Server Deployment Script

A bash script to automatically set up a secure web server with SSL certificates on Debian.

## Features

- Automated NGINX installation and configuration
- SSL certificate automation with acme.sh
- Automatic security hardening
- Scheduled certificate renewal
- System optimization for performance

## Prerequisites

- Debian 10+ 64-bit
- Sudo privileges
- Inbound traffic on TCP ports 80 and 443 from 0.0.0.0/0 allowed
- Domain name pointing to your server's IP address

## Usage

Log in as a non-root user and run:

```bash
curl -L https://github.com/xixu-me/AWSDS/raw/main/setup.sh | bash -s <username> <domain> <id>
```

Replace the following:

- `<username>`: Your login username
- `<domain>`: Your domain name
- `<id>`: A unique identifier

If you encounter the following error:

```bash
bash: curl: command not found
```

Please install `curl` and `bash` first:

```bash
sudo apt update && sudo apt install -y curl bash
```

## What Gets Installed

- NGINX web server
- SSL certificate management tools
- Cron jobs for automated maintenance
- Basic security configurations

## Security Features

- TLS 1.2/1.3 support
- Automatic certificate renewal
- HTTP to HTTPS redirection
- HSTS implementation
- Private IP filtering
- Security headers

## Maintenance

Certificates will automatically renew monthly. No manual intervention required.

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
