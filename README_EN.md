# OpenVPN Access Server - Unlimited Edition

### 🔍 Overview

A containerized deployment solution for OpenVPN Access Server 2.14.3 with license validation modifications to remove connection limits, supporting up to 2048 concurrent connections.

### ⚠️ Important Notice

> **For Educational and Research Purposes Only**
> 
> - Technical solution referenced from [oskr.cn](https://oskr.cn/archives/openvpnaccessserver294po-jie-ren-shu-xian-zhi)
> - Strictly prohibited for commercial use or production environments
> - Please comply with local laws and software license agreements
> - Users assume all responsibility and risks

### 🚀 Quick Deployment

#### System Requirements

| Component | Version | Description |
|-----------|---------|-------------|
| Docker | 20.10+ | Container runtime |
| Docker Compose | 1.29+ | Service orchestration |
| OS | Linux | Ubuntu 20.04+ / CentOS 8+ recommended |
| Memory | 512MB+ | 1GB+ recommended |
| Storage | 2GB+ | For configs and logs |

#### One-Click Deploy

```bash
# 1. Clone repository
git clone https://github.com/your-repo/openvpn-as.git
cd openvpn-as

# 2. Create data directory
sudo mkdir -p /opt/openvpn-data
sudo chown $USER:$USER /opt/openvpn-data

# 3. Start services
docker-compose up -d

# 4. Get initial password
docker-compose logs openvpn-as | grep "Initial"
```

### 🌐 Access Services

| Service | URL | Description |
|---------|-----|-------------|
| Admin Panel | `https://your-server-ip:943/admin` | System config & user management |
| User Portal | `https://your-server-ip:943` | Download client configs |
| Default Account | `openvpn` / `check logs for password` | Administrator account |

```bash
# Get initial admin password
docker-compose logs openvpn-as | grep "Initial Admin UI user password"
```

### 📊 Key Features

| Feature | Status | Description |
|---------|--------|-------------|
| 🚀 **Unlimited Connections** | ✅ | Up to 2048 concurrent connections |
| 🛡️ **Secure Protocols** | ✅ | UDP/TCP dual protocol support |
| 🖥️ **Web Management** | ✅ | Complete web administration interface |
| 📱 **Multi-Platform** | ✅ | Windows/macOS/Linux/iOS/Android support |
| 📊 **Traffic Analytics** | ✅ | Detailed connection and traffic monitoring |
| 🔐 **Certificate Management** | ✅ | Auto client certificate generation |
| 🌍 **Load Balancing** | ✅ | Multi-instance load balancing support |
| 📈 **High Availability** | ✅ | Auto-restart and health checks |

### 🔧 Operations & Management

#### Service Control

```bash
# Start services
docker-compose up -d

# Stop services
docker-compose down

# Restart specific service
docker-compose restart openvpn-as

# Check service status
docker-compose ps

# View real-time logs
docker-compose logs -f openvpn-as

# Enter container for debugging
docker-compose exec openvpn-as bash
```

#### Data Backup

```bash
# Backup configuration data
sudo tar -czf openvpn-backup-$(date +%Y%m%d).tar.gz /opt/openvpn-data

# Restore configuration data
sudo tar -xzf openvpn-backup-YYYYMMDD.tar.gz -C /
```

#### Troubleshooting

<details>
<summary><strong>Q: Forgot admin password?</strong></summary>

```bash
# Reset admin password
docker-compose exec openvpn-as /usr/local/openvpn_as/scripts/sacli --user openvpn --new_pass newpassword123 SetLocalPassword
```
</details>

<details>
<summary><strong>Q: How to add new users?</strong></summary>

```bash
# Add user via command line
docker-compose exec openvpn-as /usr/local/openvpn_as/scripts/sacli --user username --new_pass password123 SetLocalPassword
```
</details>

### � Resources

| Resource | Link | Description |
|----------|------|-------------|
| Official Docs | [OpenVPN AS Docs](https://openvpn.net/access-server/) | Complete product documentation |
| Docker Hub | [openvpn/openvpn-as](https://hub.docker.com/r/openvpn/openvpn-as) | Official Docker image |
| Client Downloads | [OpenVPN Connect](https://openvpn.net/client-connect-vpn-for-windows/) | Multi-platform clients |
| Community | [OpenVPN Forums](https://forums.openvpn.net/) | Technical support forums |

### 📄 License

This project is for educational and research purposes only. Please adhere to these principles:

- ✅ Personal learning and research
- ✅ Technical exchange and sharing
- ❌ Commercial use
- ❌ Production deployment
- ❌ Violation of software licenses
