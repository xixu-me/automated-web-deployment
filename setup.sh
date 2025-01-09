#!/bin/bash

# Check if all required parameters are provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <username> <domain> <id>"
    exit 1
fi

# Assign parameters to variables
USERNAME="$1"
DOMAIN="$2"
ID="$3"

# Update and install required packages
sudo apt update
sudo apt upgrade -y
sudo apt install cron nginx -y

# Configure web server permissions and files
sudo chown -R "$USERNAME:$USERNAME" /var/www
rm /var/www/html/index.nginx-debian.html

# Create index.html
cat >/var/www/html/index.html <<'EOF'
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>John Doe - Professional Portfolio</title>
        <style>
            :root {
                --primary: #2c3e50;
                --secondary: #3498db;
                --background: #f8f9fa;
                --text: #2c3e50;
            }
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            body {
                font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
                line-height: 1.6;
                color: var(--text);
                background-color: var(--background);
            }
            header {
                background-color: var(--primary);
                color: white;
                padding: 2rem 0;
                text-align: center;
            }
            nav {
                background-color: var(--secondary);
                padding: 1rem 0;
            }
            nav ul {
                list-style: none;
                display: flex;
                justify-content: center;
                gap: 2rem;
            }
            nav a {
                color: white;
                text-decoration: none;
                font-weight: 500;
            }
            nav a:hover {
                text-decoration: underline;
            }
            .container {
                max-width: 1200px;
                margin: 0 auto;
                padding: 2rem;
            }
            .hero {
                text-align: center;
                padding: 4rem 0;
            }
            .projects {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
                gap: 2rem;
                margin: 3rem 0;
            }
            .project-card {
                background: white;
                border-radius: 8px;
                padding: 1.5rem;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }
            .skills {
                display: flex;
                flex-wrap: wrap;
                gap: 1rem;
                margin: 2rem 0;
            }
            .skill-tag {
                background: var(--secondary);
                color: white;
                padding: 0.5rem 1rem;
                border-radius: 20px;
                font-size: 0.9rem;
            }
            footer {
                background-color: var(--primary);
                color: white;
                text-align: center;
                padding: 2rem 0;
                margin-top: 4rem;
            }
            .contact-form {
                max-width: 600px;
                margin: 0 auto;
            }
            .form-group {
                margin-bottom: 1rem;
            }
            input,
            textarea {
                width: 100%;
                padding: 0.5rem;
                margin-top: 0.5rem;
                border: 1px solid #ddd;
                border-radius: 4px;
            }
            button {
                background-color: var(--secondary);
                color: white;
                padding: 0.75rem 1.5rem;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            button:hover {
                opacity: 0.9;
            }
        </style>
    </head>
    <body>
        <header>
            <h1>John Doe</h1>
            <p>Full Stack Developer</p>
        </header>
        <nav>
            <ul>
                <li><a href="#about">About</a></li>
                <li><a href="#projects">Projects</a></li>
                <li><a href="#skills">Skills</a></li>
                <li><a href="#contact">Contact</a></li>
            </ul>
        </nav>
        <main class="container">
            <section id="about" class="hero">
                <h2>About Me</h2>
                <p>
                    Passionate full-stack developer with 5+ years of experience
                    building scalable web applications. I specialize in modern
                    JavaScript frameworks and cloud architecture.
                </p>
            </section>
            <section id="projects">
                <h2>Featured Projects</h2>
                <div class="projects">
                    <div class="project-card">
                        <h3>E-commerce Platform</h3>
                        <p>
                            A full-featured e-commerce solution built with React
                            and Node.js, featuring real-time inventory
                            management and secure payment processing.
                        </p>
                    </div>
                    <div class="project-card">
                        <h3>Task Management App</h3>
                        <p>
                            A collaborative task management application using
                            Vue.js and Firebase, with real-time updates and team
                            collaboration features.
                        </p>
                    </div>
                    <div class="project-card">
                        <h3>Analytics Dashboard</h3>
                        <p>
                            A responsive analytics dashboard built with D3.js
                            and Express, providing real-time data visualization
                            and reporting capabilities.
                        </p>
                    </div>
                </div>
            </section>
            <section id="skills">
                <h2>Skills</h2>
                <div class="skills">
                    <span class="skill-tag">JavaScript</span>
                    <span class="skill-tag">React</span>
                    <span class="skill-tag">Node.js</span>
                    <span class="skill-tag">Python</span>
                    <span class="skill-tag">SQL</span>
                    <span class="skill-tag">AWS</span>
                    <span class="skill-tag">Docker</span>
                    <span class="skill-tag">Git</span>
                </div>
            </section>
            <section id="contact">
                <h2>Contact Me</h2>
                <form class="contact-form">
                    <div class="form-group">
                        <label for="name">Name:</label>
                        <input type="text" id="name" name="name" required />
                    </div>
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" required />
                    </div>
                    <div class="form-group">
                        <label for="message">Message:</label>
                        <textarea
                            id="message"
                            name="message"
                            rows="5"
                            required
                        ></textarea>
                    </div>
                    <button type="submit">Send Message</button>
                </form>
            </section>
        </main>
        <footer><p>&copy; 2025 John Doe. All rights reserved.</p></footer>
    </body>
</html>
EOF

# Initial nginx configuration
sudo tee /etc/nginx/nginx.conf >/dev/null <<EOF
user www-data;
worker_processes auto;
pid /run/nginx.pid;
error_log /var/log/nginx/error.log;
include /etc/nginx/modules-enabled/*.conf;
events {
    worker_connections 768;
}
http {
    server {
        listen 80;
        server_name $DOMAIN;
        root /var/www/html;
        index index.html;
    }
    sendfile on;
    tcp_nopush on;
    types_hash_max_size 2048;
    include /etc/nginx/mime.types;
    default_type application/octet-stream;
    ssl_protocols TLSv1 TLSv1.1 TLSv1.2 TLSv1.3;
    ssl_prefer_server_ciphers on;
    access_log /var/log/nginx/access.log;
    gzip on;
    include /etc/nginx/conf.d/*.conf;
    include /etc/nginx/sites-enabled/*;
}
EOF

sudo systemctl reload nginx

# Install and configure acme.sh
curl https://get.acme.sh | sh
~/.acme.sh/acme.sh --upgrade --auto-upgrade
~/.acme.sh/acme.sh --set-default-ca --server letsencrypt
~/.acme.sh/acme.sh --issue -d "$DOMAIN" -w /var/www/html --keylength ec-256 --force

# Install X
sudo bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install

# Setup certificates
mkdir ~/cert
~/.acme.sh/acme.sh --install-cert -d "$DOMAIN" --ecc --fullchain-file ~/cert/x.crt --key-file ~/cert/x.key
chmod +r ~/cert/x.key

# Create certificate renewal script
cat >~/cert/cert-renew.sh <<EOF
#!/bin/bash
/home/$USERNAME/.acme.sh/acme.sh --install-cert -d $DOMAIN --ecc --fullchain-file /home/$USERNAME/cert/x.crt --key-file /home/$USERNAME/cert/x.key
echo "X Certificates Renewed"
chmod +r /home/$USERNAME/cert/xra.key
echo "Read Permission Granted for Private Key"
sudo systemctl restart xray
echo "X Restarted"
EOF

chmod +x ~/cert/cert-renew.sh

# Setup cron job
crontab -l >temp_cron
echo "0 1 1 * *   bash /home/$USERNAME/cert/cert-renew.sh" >>temp_cron
crontab temp_cron
rm temp_cron

# Configure X
sudo tee /usr/local/etc/xray/config.json >/dev/null <<EOF
{
    "dns": {
        "servers": ["https+local://1.1.1.1/dns-query", "localhost"]
    },
    "routing": {
        "rules": [
            {
                "ip": ["geoip:private"],
                "outboundTag": "block"
            },
            {
                "ip": ["geoip:cn"],
                "outboundTag": "block"
            }
        ]
    },
    "inbounds": [
        {
            "port": 443,
            "protocol": "vless",
            "settings": {
                "clients": [
                    {
                        "id": "$ID",
                        "flow": "xtls-rprx-vision"
                    }
                ],
                "decryption": "none",
                "fallbacks": [
                    {
                        "dest": 8888
                    }
                ]
            },
            "streamSettings": {
                "security": "tls",
                "tlsSettings": {
                    "rejectUnknownSni": true,
                    "alpn": "http/1.1",
                    "minVersion": "1.2",
                    "certificates": [
                        {
                            "certificateFile": "/home/$USERNAME/cert/x.crt",
                            "keyFile": "/home/$USERNAME/cert/x.key"
                        }
                    ]
                }
            }
        }
    ],
    "outbounds": [
        {
            "protocol": "freedom",
            "tag": "direct"
        },
        {
            "protocol": "blackhole",
            "tag": "block"
        }
    ],
    "policy": {
        "levels": {
            "0": {
                "handshake": 2,
                "connIdle": 150
            }
        }
    }
}
EOF

# Start and enable X
sudo systemctl start xray
sudo systemctl enable xray

# Configure system settings
sudo tee /etc/sysctl.conf >/dev/null <<'EOF'
net.core.default_qdisc=fq
net.ipv4.tcp_congestion_control=bbr
EOF

# Final nginx configuration
sudo tee /etc/nginx/nginx.conf >/dev/null <<EOF
user www-data;
worker_processes auto;
pid /run/nginx.pid;
error_log /var/log/nginx/error.log;
include /etc/nginx/modules-enabled/*.conf;
events {
    worker_connections 768;
}
http {
    server {
        listen 80;
        server_name $DOMAIN;
        return 301 https://\$http_host\$request_uri;
    }
    server {
        listen 8888;
        root /var/www/html;
        index index.html;
        add_header Strict-Transport-Security "max-age=63072000" always;
    }
    sendfile on;
    tcp_nopush on;
    types_hash_max_size 2048;
    include /etc/nginx/mime.types;
    default_type application/octet-stream;
    ssl_protocols TLSv1 TLSv1.1 TLSv1.2 TLSv1.3;
    ssl_prefer_server_ciphers on;
    access_log /var/log/nginx/access.log;
    gzip on;
    include /etc/nginx/conf.d/*.conf;
    include /etc/nginx/sites-enabled/*;
}
EOF

# Restart services and system
sudo systemctl restart nginx
sudo reboot
