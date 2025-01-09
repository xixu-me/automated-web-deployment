# AWSDS - Automated Web Server Deployment Script

A bash script to automatically set up a secure web server with SSL certificates on Debian.

## Features

- Automated NGINX installation and configuration
- SSL certificate automation with acme.sh
- Professional portfolio webpage template
- Automatic security hardening
- Scheduled certificate renewal
- System optimization for performance

## Prerequisites

- Debian 12 or later
- Root or sudo privileges
- Domain name pointing to your server's IP address

## Usage

```bash
curl -s https://github.com/xixu-me/AWSDS/raw/main/setup.sh | bash -s <username> <domain> <id>
```

Replace the following:
- `<username>`: Your system username
- `<domain>`: Your domain name
- `<id>`: A unique identifier for security settings

## What Gets Installed

- NGINX web server
- SSL certificate management tools
- Cron jobs for automated maintenance
- Basic security configurations
- Sample portfolio website

## Default Web Template

The script includes a responsive portfolio template featuring:
- Professional layout
- About section
- Projects showcase
- Skills display
- Contact form
- Mobile-friendly design

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

Copyright &copy; 2025 [Xi Xu](https://xi-xu.me). All rights reserved.

Licensed under the [GPL-3.0](LICENSE) license.  
