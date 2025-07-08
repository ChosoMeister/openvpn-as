# OpenVPN Access Server 开心版

[English](#english) | [中文](#中文)

## 中文

### 🔍 项目介绍

本项目基于 OpenVPN Access Server 2.13.1，通过修改许可证验证机制来解除连接数限制。

**⚠️ 免责声明：** 
- 方法来自 [oskr.cn](https://oskr.cn/archives/openvpnaccessserver294po-jie-ren-shu-xian-zhi)
- 仅供学习交流使用，不得用于商业用途
- 使用本项目产生的任何后果由使用者自行承担

### 🚀 快速开始

#### 环境要求
- Docker
- Docker Compose
- Linux 系统（推荐 Ubuntu/CentOS）

#### 安装步骤

1. **克隆项目**
   ```bash
   git clone <repository-url>
   cd openvpn-as
   ```

2. **修改配置（可选）**
   编辑 `docker-compose.yml` 文件：
   ```yaml
   ports:
     - "943:943"    # Web UI 端口
     - "443:443"    # HTTPS 端口
     - "1194:1194/udp"  # OpenVPN UDP 端口
   volumes:
     - /your/path:/openvpn  # 修改为你的数据存储路径
   ```

3. **启动服务**
   ```bash
   docker-compose up -d
   ```

4. **访问管理界面**
   - Web UI: `https://your-server-ip:943/admin`
   - 用户界面: `https://your-server-ip:943`
   - 默认用户名: `openvpn`
   - 默认密码: 查看容器日志获取

### 📊 功能特性

- ✅ 解除连接数限制（最大2048个并发连接）
- ✅ 基于官方 Docker 镜像构建
- ✅ 支持 UDP/TCP 协议
- ✅ Web 管理界面
- ✅ 用户证书管理
- ✅ 流量统计

### 🔧 常用命令

```bash
# 查看服务状态
docker-compose ps

# 查看日志
docker-compose logs -f

# 停止服务
docker-compose down

# 重启服务
docker-compose restart

# 进入容器
docker-compose exec openvpn-as bash
```

### 📖 参考资料

- [官方 Docker Hub 项目](https://hub.docker.com/r/openvpn/openvpn-as)
- [OpenVPN Access Server 官方文档](https://openvpn.net/access-server/)

---

## English

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

### 📖 References

- [Official Docker Hub Project](https://hub.docker.com/r/openvpn/openvpn-as)
- [OpenVPN Access Server Documentation](https://openvpn.net/access-server/)