# OpenVPN Access Server - Unlimited Edition

### 🔍 Project Description

This project is based on OpenVPN Access Server 2.13.1, with modifications to bypass connection limits by patching the license validation mechanism.

**⚠️ Disclaimer:**
- Method sourced from [oskr.cn](https://oskr.cn/archives/openvpnaccessserver294po-jie-ren-shu-xian-zhi)
- For educational and learning purposes only
- Not intended for commercial use
- Users are responsible for any consequences

### 🚀 Quick Start

#### Prerequisites
- Docker
- Docker Compose
- Linux system (Ubuntu/CentOS recommended)

#### Installation Steps

1. **Clone Repository**
   ```bash
   git clone <repository-url>
   cd openvpn-as
   ```

2. **Configure (Optional)**
   Edit `docker-compose.yml`:
   ```yaml
   ports:
     - "943:943"    # Web UI port
     - "443:443"    # HTTPS port
     - "1194:1194/udp"  # OpenVPN UDP port
   volumes:
     - /your/path:/openvpn  # Change to your data storage path
   ```

3. **Start Services**
   ```bash
   docker-compose up -d
   ```

4. **Access Management Interface**
   - Admin UI: `https://your-server-ip:943/admin`
   - User UI: `https://your-server-ip:943`
   - Default username: `openvpn`
   - Default password: Check container logs

### 📊 Features

- ✅ Unlimited connections (up to 2048 concurrent)
- ✅ Built on official Docker image
- ✅ UDP/TCP protocol support
- ✅ Web management interface
- ✅ User certificate management
- ✅ Traffic statistics

### 🔧 Common Commands

```bash
# Check service status
docker-compose ps

# View logs
docker-compose logs -f

# Stop services
docker-compose down

# Restart services
docker-compose restart

# Enter container
docker-compose exec openvpn-as bash
```

### 🛠️ Project Structure

```
openvpn-as/
├── docker-compose.yml  # Docker Compose configuration
├── Dockerfile         # Custom Docker image build file
├── uprop.py          # License patch script
├── README.md         # Project documentation
└── README_EN.md      # English documentation
```

### 🔒 Security Notes

- Change default admin password immediately after first login
- Use strong passwords for VPN user accounts
- Configure firewall rules appropriately
- Regularly update the base Docker image
- Monitor connection logs for suspicious activity

### 🐛 Troubleshooting

#### Common Issues

1. **Container fails to start**
   ```bash
   # Check logs
   docker-compose logs openvpn-as
   
   # Verify TUN device availability
   ls -la /dev/net/tun
   ```

2. **Cannot access web interface**
   - Verify ports are not blocked by firewall
   - Check if ports are already in use: `netstat -tlnp | grep :943`

3. **VPN connection fails**
   - Ensure UDP port 1194 is open
   - Check client configuration file
   - Verify server IP address in client config

#### Getting Help

- Check container logs: `docker-compose logs -f`
- Verify network connectivity
- Review OpenVPN Access Server documentation

### 📖 References

- [Official Docker Hub Project](https://hub.docker.com/r/openvpn/openvpn-as)
- [OpenVPN Access Server Documentation](https://openvpn.net/access-server/)
- [Docker Compose Documentation](https://docs.docker.com/compose/)

### 📜 License

This project is for educational purposes only. Please respect the original OpenVPN Access Server license terms and use this modification responsibly.
