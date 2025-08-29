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

# Install required packages
sudo apt install cron nginx -y

# Configure web server permissions and files
sudo chown -R "$USERNAME:$USERNAME" /var/www
rm /var/www/html/index.nginx-debian.html

# Create index.html
cat >/var/www/html/index.html <<'EOF'
<!DOCTYPE html>
<html lang="en" class="scroll-smooth">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>John Doe - Professional Portfolio</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
        }
        .section {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
    </style>
</head>
<body class="bg-gray-900 text-white">

    <!-- Header -->
    <header class="bg-gray-900/80 backdrop-blur-sm fixed top-0 left-0 right-0 z-50">
        <div class="container mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex items-center justify-between h-16">
                <div class="flex-shrink-0">
                    <a href="#home" class="text-2xl font-bold text-white">JD</a>
                </div>
                <nav class="hidden md:flex md:space-x-8">
                    <a href="#home" class="text-gray-300 hover:text-white transition-colors duration-300">Home</a>
                    <a href="#about" class="text-gray-300 hover:text-white transition-colors duration-300">About</a>
                    <a href="#projects" class="text-gray-300 hover:text-white transition-colors duration-300">Projects</a>
                    <a href="#contact" class="text-gray-300 hover:text-white transition-colors duration-300">Contact</a>
                </nav>
                <div class="md:hidden">
                    <button id="menu-btn" class="text-white focus:outline-none">
                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16m-7 6h7"></path></svg>
                    </button>
                </div>
            </div>
        </div>
        <!-- Mobile Menu -->
        <div id="mobile-menu" class="hidden md:hidden">
            <a href="#home" class="block py-2 px-4 text-sm text-gray-300 hover:bg-gray-700">Home</a>
            <a href="#about" class="block py-2 px-4 text-sm text-gray-300 hover:bg-gray-700">About</a>
            <a href="#projects" class="block py-2 px-4 text-sm text-gray-300 hover:bg-gray-700">Projects</a>
            <a href="#contact" class="block py-2 px-4 text-sm text-gray-300 hover:bg-gray-700">Contact</a>
        </div>
    </header>

    <main>
        <!-- Home Section -->
        <section id="home" class="section pt-16">
            <div class="container mx-auto px-4 sm:px-6 lg:px-8 text-center">
                <img src="https://placehold.co/150x150/4A5568/E2E8F0?text=JD" alt="Your Name" class="w-40 h-40 md:w-48 md:h-48 rounded-full mx-auto mb-6 border-4 border-gray-700 shadow-lg">
                <h1 class="text-4xl md:text-6xl font-bold mb-2">John Doe</h1>
                <p class="text-xl md:text-2xl text-gray-400 mb-6">Software Engineer & Web Developer</p>
                <p class="max-w-2xl mx-auto text-gray-300 mb-8">
                    I build elegant, responsive, and user-friendly web applications. Passionate about clean code and modern web technologies.
                </p>
                <div class="flex justify-center space-x-6">
                    <a href="#" class="text-gray-400 hover:text-white transition-colors duration-300">
                        <svg class="w-8 h-8" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true"><path fill-rule="evenodd" d="M12 2C6.477 2 2 6.477 2 12.014c0 4.425 2.865 8.166 6.839 9.489.5.092.682-.217.682-.482 0-.237-.009-.868-.014-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.031-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.203 2.398.1 2.651.64.7 1.03 1.595 1.03 2.688 0 3.848-2.338 4.695-4.566 4.942.359.308.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.578.688.482A10.001 10.001 0 0022 12.014C22 6.477 17.523 2 12 2z" clip-rule="evenodd" /></svg>
                    </a>
                    <a href="#" class="text-gray-400 hover:text-white transition-colors duration-300">
                        <svg class="w-8 h-8" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true"><path d="M19 0h-14c-2.761 0-5 2.239-5 5v14c0 2.761 2.239 5 5 5h14c2.762 0 5-2.239 5-5v-14c0-2.761-2.238-5-5-5zm-11 19h-3v-11h3v11zm-1.5-12.268c-.966 0-1.75-.79-1.75-1.764s.784-1.764 1.75-1.764 1.75.79 1.75 1.764-.783 1.764-1.75 1.764zm13.5 12.268h-3v-5.604c0-3.368-4-3.113-4 0v5.604h-3v-11h3v1.765c1.396-2.586 7-2.777 7 2.476v6.759z"/></svg>
                    </a>
                </div>
            </div>
        </section>

        <!-- About Section -->
        <section id="about" class="section bg-gray-800">
            <div class="container mx-auto px-4 sm:px-6 lg:px-8">
                <div class="text-center mb-12">
                    <h2 class="text-3xl md:text-4xl font-bold">About Me</h2>
                    <p class="text-gray-400 mt-2">A little bit about my journey and skills.</p>
                </div>
                <div class="flex flex-col md:flex-row items-center gap-10 md:gap-16">
                    <div class="md:w-1/2 text-center md:text-left">
                        <h3 class="text-2xl font-semibold mb-4">Who I Am</h3>
                        <p class="text-gray-300 leading-relaxed mb-4">
                            Hello! I'm John Doe, a software engineer based in [Your City]. I have a passion for creating beautiful and functional websites and applications. My journey into tech started with a simple "Hello World" and has since grown into a full-fledged career where I get to solve complex problems and build amazing things.
                        </p>
                        <p class="text-gray-300 leading-relaxed">
                            When I'm not coding, you can find me exploring new hiking trails, reading a good book, or experimenting with new recipes in the kitchen.
                        </p>
                    </div>
                    <div class="md:w-1/2">
                        <h3 class="text-2xl font-semibold mb-4 text-center md:text-left">My Skills</h3>
                        <div class="flex flex-wrap gap-3 justify-center md:justify-start">
                            <span class="bg-gray-700 rounded-full px-4 py-2 text-sm font-medium">HTML</span>
                            <span class="bg-gray-700 rounded-full px-4 py-2 text-sm font-medium">CSS</span>
                            <span class="bg-gray-700 rounded-full px-4 py-2 text-sm font-medium">JavaScript</span>
                            <span class="bg-gray-700 rounded-full px-4 py-2 text-sm font-medium">React</span>
                            <span class="bg-gray-700 rounded-full px-4 py-2 text-sm font-medium">Node.js</span>
                            <span class="bg-gray-700 rounded-full px-4 py-2 text-sm font-medium">Tailwind CSS</span>
                            <span class="bg-gray-700 rounded-full px-4 py-2 text-sm font-medium">Git & GitHub</span>
                            <span class="bg-gray-700 rounded-full px-4 py-2 text-sm font-medium">Firebase</span>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Projects Section -->
        <section id="projects" class="section">
            <div class="container mx-auto px-4 sm:px-6 lg:px-8">
                <div class="text-center mb-12">
                    <h2 class="text-3xl md:text-4xl font-bold">My Projects</h2>
                    <p class="text-gray-400 mt-2">A selection of my work. Feel free to explore.</p>
                </div>
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
                    <!-- Project Card 1 -->
                    <div class="bg-gray-800 rounded-lg overflow-hidden shadow-lg transform hover:scale-105 transition-transform duration-300">
                        <img src="https://placehold.co/600x400/4A5568/E2E8F0?text=Project+1" alt="Project 1" class="w-full h-48 object-cover">
                        <div class="p-6">
                            <h3 class="text-xl font-semibold mb-2">Project Title One</h3>
                            <p class="text-gray-400 mb-4">A brief description of the project, the technologies used, and the problem it solves.</p>
                            <div class="flex space-x-4">
                                <a href="#" class="text-indigo-400 hover:text-indigo-300 font-medium">Live Demo</a>
                                <a href="#" class="text-indigo-400 hover:text-indigo-300 font-medium">Source Code</a>
                            </div>
                        </div>
                    </div>
                    <!-- Project Card 2 -->
                    <div class="bg-gray-800 rounded-lg overflow-hidden shadow-lg transform hover:scale-105 transition-transform duration-300">
                        <img src="https://placehold.co/600x400/4A5568/E2E8F0?text=Project+2" alt="Project 2" class="w-full h-48 object-cover">
                        <div class="p-6">
                            <h3 class="text-xl font-semibold mb-2">Project Title Two</h3>
                            <p class="text-gray-400 mb-4">A brief description of the project, the technologies used, and the problem it solves.</p>
                            <div class="flex space-x-4">
                                <a href="#" class="text-indigo-400 hover:text-indigo-300 font-medium">Live Demo</a>
                                <a href="#" class="text-indigo-400 hover:text-indigo-300 font-medium">Source Code</a>
                            </div>
                        </div>
                    </div>
                    <!-- Project Card 3 -->
                    <div class="bg-gray-800 rounded-lg overflow-hidden shadow-lg transform hover:scale-105 transition-transform duration-300">
                        <img src="https://placehold.co/600x400/4A5568/E2E8F0?text=Project+3" alt="Project 3" class="w-full h-48 object-cover">
                        <div class="p-6">
                            <h3 class="text-xl font-semibold mb-2">Project Title Three</h3>
                            <p class="text-gray-400 mb-4">A brief description of the project, the technologies used, and the problem it solves.</p>
                            <div class="flex space-x-4">
                                <a href="#" class="text-indigo-400 hover:text-indigo-300 font-medium">Live Demo</a>
                                <a href="#" class="text-indigo-400 hover:text-indigo-300 font-medium">Source Code</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Contact Section -->
        <section id="contact" class="section bg-gray-800">
            <div class="container mx-auto px-4 sm:px-6 lg:px-8">
                <div class="text-center mb-12">
                    <h2 class="text-3xl md:text-4xl font-bold">Get In Touch</h2>
                    <p class="text-gray-400 mt-2">I'm open to new opportunities. Let's connect!</p>
                </div>
                <div class="max-w-xl mx-auto">
                    <form action="#" method="POST" class="space-y-6">
                        <div>
                            <label for="name" class="sr-only">Name</label>
                            <input type="text" name="name" id="name" autocomplete="name" required class="w-full bg-gray-700 border border-gray-600 rounded-md py-3 px-4 text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-indigo-500" placeholder="Your Name">
                        </div>
                        <div>
                            <label for="email" class="sr-only">Email</label>
                            <input type="email" name="email" id="email" autocomplete="email" required class="w-full bg-gray-700 border border-gray-600 rounded-md py-3 px-4 text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-indigo-500" placeholder="Your Email">
                        </div>
                        <div>
                            <label for="message" class="sr-only">Message</label>
                            <textarea id="message" name="message" rows="4" required class="w-full bg-gray-700 border border-gray-600 rounded-md py-3 px-4 text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-indigo-500" placeholder="Your Message"></textarea>
                        </div>
                        <div>
                            <button type="submit" class="w-full bg-indigo-600 hover:bg-indigo-700 text-white font-bold py-3 px-6 rounded-md transition-colors duration-300">
                                Send Message
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </main>

    <!-- Footer -->
    <footer class="bg-gray-900">
        <div class="container mx-auto px-4 sm:px-6 lg:px-8 py-6 text-center text-gray-400">
            <p>&copy; <span id="year"></span> John Doe. All Rights Reserved.</p>
        </div>
    </footer>

    <script>
        // Mobile menu toggle
        const menuBtn = document.getElementById('menu-btn');
        const mobileMenu = document.getElementById('mobile-menu');
        menuBtn.addEventListener('click', () => {
            mobileMenu.classList.toggle('hidden');
        });

        // Close mobile menu when a link is clicked
        const mobileLinks = document.querySelectorAll('#mobile-menu a');
        mobileLinks.forEach(link => {
            link.addEventListener('click', () => {
                mobileMenu.classList.add('hidden');
            });
        });

        // Set current year in footer
        document.getElementById('year').textContent = new Date().getFullYear();
    </script>
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
chmod +r /home/$USERNAME/cert/x.key
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
                    "alpn": ["http/1.1"],
                    "minVersion": "1.3",
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
                "handshake": 4,
                "connIdle": 300
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
