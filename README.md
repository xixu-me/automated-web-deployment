# Automated Web Deployment Script

A bash script for automating the deployment of a professional portfolio website with SSL certificate management on Ubuntu/Debian servers.

## Overview

This repository contains an automated deployment script that sets up a complete web server environment with:

- **Nginx web server** with optimized configuration
- **SSL certificate management** using acme.sh and Let's Encrypt
- **Professional portfolio website** with modern, responsive design
- **Automatic certificate renewal** via cron jobs
- **Security optimizations** and best practices

## Features

- 🚀 **One-command deployment** - Deploy everything with a single script
- 🔒 **Automatic SSL** - Generates and manages SSL certificates
- 📱 **Responsive design** - Mobile-friendly portfolio website
- 🔄 **Auto-renewal** - Certificates renew automatically
- ⚡ **Performance optimized** - BBR congestion control and optimized settings
- 🛡️ **Security hardened** - HTTPS redirects and security headers

## Prerequisites

- Ubuntu/Debian-based Linux server
- Root or sudo access
- Domain name pointing to your server's IP address
- Open ports 80 and 443

## Usage

1. Log in as a non-root user and update your system:

    ```bash
    sudo apt update && sudo apt upgrade -y
    ```

2. Run the setup script with required parameters:

    ```bash
    curl -L https://github.com/xixu-me/automated-web-deployment/raw/main/setup.sh | bash -s <username> <domain> <unique-id>
    ```

3. If you encounter the following error:

    ```text
    bash: curl: command not found
    ```

    Please install `curl` and `bash` first:

    ```bash
    sudo apt install curl bash -y
    ```

### Parameters

- `<username>`: Your system username
- `<domain>`: Your domain name (e.g., example.com)
- `<unique-id>`: A unique identifier (UUID format recommended)

### Example

```bash
curl -L https://github.com/xixu-me/automated-web-deployment/raw/main/setup.sh | bash -s john example.com 550e8400-e29b-41d4-a716-446655440000
```

## What Gets Installed

The script automatically installs and configures:

1. **System packages**: nginx, wget, unzip, openssl, cron
2. **Web server**: Nginx with optimized configuration
3. **SSL certificates**: Let's Encrypt certificates via acme.sh
4. **Portfolio website**: Professional HTML/CSS portfolio template
5. **Security settings**: System optimizations and security headers

## Post-Installation

After the script completes:

- Your website will be accessible at `https://yourdomain.com`
- SSL certificates will auto-renew weekly
- The server will reboot automatically to apply all changes

## File Structure

```text
/var/www/html/          # Website files
~/cert/                 # SSL certificates
~/cert/renew.sh         # Certificate renewal script
```

## Certificate Management

- **Location**: `~/cert/x.crt` and `~/cert/x.key`
- **Renewal**: Automatic weekly check via cron
- **Logs**: Certificate renewal logs in `~/cert/renewal.log`

## Customization

To customize the portfolio website:

1. Edit `/var/www/html/index.html` after installation
2. Modify the content, styling, and information as needed
3. The website uses modern CSS with responsive design

## Troubleshooting

### Common Issues

1. **Domain not pointing to server**: Ensure your domain's DNS A record points to your server's IP
2. **Firewall blocking ports**: Make sure ports 80 and 443 are open
3. **Permission errors**: Run the script as a non-root user with sudo access

### Service Status

Check if services are running:

```bash
sudo systemctl status nginx
```

### Certificate Status

Check certificate expiration:

```bash
openssl x509 -in ~/cert/x.crt -text -noout | grep -E "(Not Before|Not After)"
```

## Security Considerations

- The script implements security best practices including HTTPS redirects
- Uses modern TLS protocols (TLSv1.2 and TLSv1.3)
- Applies security headers and optimized configurations
- Regular certificate renewals prevent expiration

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.

## Disclaimer

⚠️ **Important Notice**

This script is provided for educational and legitimate web deployment purposes only. Users are responsible for:

- Ensuring compliance with all applicable laws and regulations
- Proper server security and maintenance
- Understanding the configurations being applied to their systems
- Regular security updates and monitoring

The authors and contributors of this project:

- Make no warranties about the security, reliability, or suitability of this script
- Are not responsible for any damage, data loss, or security breaches
- Recommend thorough testing in a development environment before production use
- Advise users to review and understand the script before execution

**Use at your own risk.** Always backup your data and test in a safe environment first.

## Support

For issues and questions:

- Review the troubleshooting section above
- Ensure you're using a supported operating system (Ubuntu/Debian)

---

**Note**: This script automatically reboots the server after installation to apply all system optimizations.
