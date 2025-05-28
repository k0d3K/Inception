# Inception

> A Docker-based project to set up a fully functional WordPress website with Nginx, MariaDB, and PHP-FPM — as required by the 42 Inception project.

## 🧩 Overview

This project automates the deployment of a WordPress site using Docker containers. It includes:

- **Nginx**: Web server with HTTPS enabled via a self-signed certificate.
- **MariaDB**: Lightweight and fast database server.
- **WordPress**: Content management system.
	- **PHP-FPM**: To serve dynamic content.
	- **WP-CLI**: For headless WordPress configuration.

Everything is orchestrated via `docker-compose` and managed using a `Makefile`.

---

## 🚀 Quick Start

### ⚠️ Prerequisites

Before running the project, make sure the following tools are installed:

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)
- `make` utility
- root privileges
Your user must also be in the `docker` group. If not, launch:
```bash
sudo usermod -aG docker $USER
```
> 🔄 Note: After adding your user to the `docker` group, a logout/login is required for the change to apply.

### 💡 Recommendation

It is strongly recommended to use a dedicated Virtual Machine for this project.  
Set the VM’s username to match the domain name you plan to use (e.g., `lguerbig` for `lguerbig.42.fr`) to simplify path and permission management.

---

### 🛠️ Setup & Launch

First, add the following line to your local /etc/hosts file to map the domain to localhost:
```
127.0.0.1 <your-login>.42.fr
```
You can do this by editing the file with:
```
sudo nano /etc/hosts
```

Then run the following in the root of your project:

```bash
make
```

This will:
- Print a cool ASCII logo 😎
- Build the containers images
- Create required volumes under `/home/<your-login>/data/`
- Start all containers in the background

---

### 🔐 HTTPS Certificate

This project uses a self-signed certificate. When accessing https://<your-login>.42.fr, you may receive a browser warning. You can safely bypass this during development.

You can log in by accessing `https://<your-login>.42.fr/wp-admin`.

## ✅ Test everything

### 🌐 Manda

Connect to `<your-login>.42.fr` on firefox. It handles self-signed certificates best.
You will see a warning "Potential Security Risk Ahead" due to self-signed certificate, you can safely clic oin `Advanced...` and then `Accept the Risk and Continue`.

### Redis cache system

To check that the Redis chache sytemt is working proprely you can ping the server inside the Redis container:
```
docker exec -it redis sh
redis-cli -h redis ping
```
You should see PONG if it’s working.

### FTP server

You can can access the FTP server with:
```bash
ftp localhost 21
```
You will log in with `<your-login>` and the password `1234` as set in the .env file.
You can now download files from the server using:
```bash
get <filename>
```
and upload files using:
```bash
put <filename>
```
The `ls` command can then list the files in the server curent directory.


🚢 Welcome to the Docker world!

---

👨‍💻 Author
- lguerbig
