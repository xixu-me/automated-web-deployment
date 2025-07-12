# Automated Web Deployment Script

A comprehensive automation script for deploying professional portfolio websites with SSL certificates and optimized web server configuration.

## 🚀 Features

- **Automated Web Server Setup**: Configures Nginx with optimized settings
- **SSL Certificate Management**: Automatic SSL certificate provisioning and renewal using acme.sh
- **Professional Portfolio Template**: Includes a beautiful, responsive portfolio website
- **System Optimization**: Configures BBR congestion control and other performance optimizations
- **Certificate Auto-Renewal**: Sets up automated certificate renewal via cron jobs
- **Security Headers**: Implements HSTS and other security best practices

## 📋 Prerequisites

- Ubuntu/Debian-based Linux server
- Root or sudo access
- Domain name pointing to your server's IP address
- Open ports 80 and 443

## 🛠️ Usage

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
./setup.sh john example.com 12345678-1234-1234-1234-123456789abc
```

## 🎨 Portfolio Features

The included portfolio template features:

- **Responsive Design**: Works on all devices and screen sizes
- **Modern UI**: Clean, professional design with CSS Grid and Flexbox
- **Contact Form**: Ready-to-use contact form structure
- **Project Showcase**: Grid layout for displaying projects
- **Skills Section**: Tag-based skills display
- **SEO Optimized**: Proper HTML structure and meta tags

### Customization

To customize the portfolio:

1. Edit `/var/www/html/index.html` after installation
2. Modify the personal information, projects, and skills
3. Update the color scheme by changing CSS custom properties

## 🔧 What the Script Does

1. **Package Installation**: Installs required packages (cron, nginx)
2. **Web Server Configuration**: Sets up Nginx with optimized configuration
3. **SSL Certificate Setup**: Provisions SSL certificates using Let's Encrypt
4. **Portfolio Deployment**: Creates and deploys a professional portfolio website
5. **Auto-Renewal Setup**: Configures automatic certificate renewal
6. **System Optimization**: Applies performance optimizations
7. **Security Configuration**: Implements security headers and HTTPS redirect

## 📁 File Structure

```text
/var/www/html/           # Web root directory
├── index.html           # Portfolio website
/etc/xray/cert/          # SSL certificates directory
├── x.crt                # SSL certificate
├── x.key                # Private key
└── renew.sh             # Certificate renewal script
```

## 🔒 Security Features

- **HTTPS Redirect**: Automatic HTTP to HTTPS redirection
- **HSTS Headers**: Strict Transport Security implementation
- **SSL Configuration**: Modern TLS protocols and cipher suites
- **Secure File Permissions**: Proper file ownership and permissions

## 🔄 Maintenance

### Certificate Renewal

Certificates are automatically renewed monthly via cron job. To manually renew:

```bash
bash ~/cert/etc/xray/cert/renew.sh
```

### Nginx Configuration

Main configuration file: `/etc/nginx/nginx.conf`

To reload Nginx after changes:

```bash
sudo systemctl reload nginx
```

## 🐛 Troubleshooting

### Common Issues

1. **Domain not pointing to server**: Ensure DNS A record points to your server's IP
2. **Firewall blocking ports**: Make sure ports 80 and 443 are open
3. **Permission errors**: Ensure script is run with appropriate privileges

### Log Files

- Nginx access logs: `/var/log/nginx/access.log`
- Nginx error logs: `/var/log/nginx/error.log`
- System logs: `journalctl -u nginx`

## 📝 License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.

## ⚠️ Important Notes

- This script will reboot the server at the end of installation
- Backup any existing Nginx configuration before running
- The script is designed for fresh server installations
- Domain validation is required for SSL certificate issuance
