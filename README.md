# OpenVPN Access Server Docker 部署

[![Docker](https://img.shields.io/badge/Docker-20.10+-blue.svg)](https://www.docker.com/)
[![OpenVPN AS](https://img.shields.io/badge/OpenVPN%20AS-2.13.1-green.svg)](https://openvpn.net/access-server/)
[![License](https://img.shields.io/badge/License-Educational%20Only-red.svg)](#disclaimer)

[English](#english) | [Farsi](README_FA.md) | [中文](#中文)

---

## 中文

### 🔍 项目概述

基于 OpenVPN Access Server 2.13.1 的 Docker 容器化部署方案，通过许可证验证机制修改来解除连接数限制，支持最多 2048 个并发连接。

### ⚠️ 重要声明

> **仅供学习研究使用**
> 
> - 技术方案参考自 [oskr.cn](https://oskr.cn/archives/openvpnaccessserver294po-jie-ren-shu-xian-zhi)
> - 严禁用于商业用途或生产环境
> - 请遵守当地法律法规和软件许可协议
> - 使用者需自行承担所有责任和风险

### 🚀 快速部署

#### 系统要求

| 组件 | 版本要求 | 说明 |
|------|----------|------|
| Docker | 20.10+ | 容器运行环境 |
| Docker Compose | 1.29+ | 服务编排工具 |
| 操作系统 | Linux | 推荐 Ubuntu 20.04+ / CentOS 8+ |
| 内存 | 512MB+ | 推荐 1GB 以上 |
| 磁盘 | 2GB+ | 存储配置和日志 |

#### 一键部署

```bash
# 1. 克隆项目
git clone https://github.com/your-repo/openvpn-as.git
cd openvpn-as

# 2. 创建数据目录
sudo mkdir -p /opt/openvpn-data
sudo chown $USER:$USER /opt/openvpn-data

# 3. 启动服务
docker-compose up -d

# 4. 查看初始密码
docker-compose logs openvpn-as | grep "Initial"
```

#### 自定义配置

1. **修改端口映射**
   ```yaml
   # docker-compose.yml
   ports:
     - "943:943"        # Web 管理界面
     - "443:443"        # HTTPS 端口
     - "1194:1194/udp"  # OpenVPN UDP
     - "14810:14810"    # TCP 备用端口
   ```

2. **修改数据存储路径**
   ```yaml
   volumes:
     - /opt/openvpn-data:/openvpn  # 替换为你的路径
   ```

3. **环境变量配置**
   ```yaml
   environment:
     - OPENVPN_AS_ADMIN_UI_HTTPS_PORT=943
     - OPENVPN_AS_DAEMON_TCP_PORT=443
   ```

### 🌐 访问服务

| 服务 | 地址 | 说明 |
|------|------|------|
| 管理界面 | `https://your-server-ip:943/admin` | 系统配置和用户管理 |
| 用户门户 | `https://your-server-ip:943` | 下载配置文件 |
| 默认账户 | `openvpn` / `查看日志获取密码` | 管理员账户 |

```bash
# 获取初始管理员密码
docker-compose logs openvpn-as | grep "Initial Admin UI user password"
```

### 📊 核心特性

| 特性 | 状态 | 描述 |
|------|------|------|
| 🚀 **无连接限制** | ✅ | 支持最多 2048 个并发连接 |
| 🛡️ **安全协议** | ✅ | 支持 UDP/TCP 双协议 |
| 🖥️ **Web 管理** | ✅ | 完整的 Web 管理界面 |
| 📱 **多平台** | ✅ | 支持 Windows/macOS/Linux/iOS/Android |
| 📊 **流量统计** | ✅ | 详细的连接和流量监控 |
| 🔐 **证书管理** | ✅ | 自动生成和分发客户端证书 |
| 🌍 **负载均衡** | ✅ | 支持多实例负载均衡 |
| 📈 **高可用** | ✅ | 容器自动重启和健康检查 |

### 🔧 运维管理

#### 服务控制

```bash
# 启动服务
docker-compose up -d

# 停止服务
docker-compose down

# 重启服务
docker-compose restart openvpn-as

# 查看服务状态
docker-compose ps

# 实时查看日志
docker-compose logs -f openvpn-as

# 进入容器调试
docker-compose exec openvpn-as bash
```

#### 数据备份

```bash
# 备份配置数据
sudo tar -czf openvpn-backup-$(date +%Y%m%d).tar.gz /opt/openvpn-data

# 恢复配置数据
sudo tar -xzf openvpn-backup-YYYYMMDD.tar.gz -C /
```

#### 性能监控

```bash
# 查看资源使用情况
docker stats openvpn-as

# 查看网络连接状态
docker-compose exec openvpn-as netstat -tlnp

# 查看当前连接用户
docker-compose exec openvpn-as cat /openvpn/as.log | grep "Connection"
```

#### 常见问题

<details>
<summary><strong>Q: 忘记管理员密码怎么办？</strong></summary>

```bash
# 重置管理员密码
docker-compose exec openvpn-as /usr/local/openvpn_as/scripts/sacli --user openvpn --new_pass newpassword123 SetLocalPassword
```
</details>

<details>
<summary><strong>Q: 如何添加新用户？</strong></summary>

```bash
# 通过命令行添加用户
docker-compose exec openvpn-as /usr/local/openvpn_as/scripts/sacli --user username --new_pass password123 SetLocalPassword
```
</details>

<details>
<summary><strong>Q: 端口被占用怎么办？</strong></summary>

修改 `docker-compose.yml` 中的端口映射：
```yaml
ports:
  - "9943:943"     # 修改外部端口
  - "4443:443"     # 修改外部端口
  - "11194:1194/udp"
```
</details>

### � 相关资源

| 资源 | 链接 | 描述 |
|------|------|------|
| 官方文档 | [OpenVPN AS Docs](https://openvpn.net/access-server/) | 完整的产品文档 |
| Docker Hub | [openvpn/openvpn-as](https://hub.docker.com/r/openvpn/openvpn-as) | 官方 Docker 镜像 |
| 客户端下载 | [OpenVPN Connect](https://openvpn.net/client-connect-vpn-for-windows/) | 各平台客户端 |
| 社区支持 | [OpenVPN Forums](https://forums.openvpn.net/) | 技术支持论坛 |

### 🤝 贡献指南

欢迎提交 Issue 和 Pull Request 来改进项目！

1. Fork 本项目
2. 创建功能分支 (`git checkout -b feature/amazing-feature`)
3. 提交更改 (`git commit -m 'Add amazing feature'`)
4. 推送到分支 (`git push origin feature/amazing-feature`)
5. 创建 Pull Request

### 📄 许可证

本项目仅供学习和研究使用。请务必遵守以下原则：

- ✅ 个人学习和研究
- ✅ 技术交流和分享
- ❌ 商业用途
- ❌ 生产环境部署
- ❌ 违反软件许可协议

---

## English

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
