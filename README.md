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

### ✅ Prerequisites

Make sure the following tools are installed:

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)
- `make` utility
- root privileges
- your user must be in the docker group. If not yout luanch:
```
sudo usermod -aG docker $USER
```

I strongly recommand creating a special Virtual Machine for this project and setting your user login so that is fits the domain name you want.

---

### 🛠️ Setup & Launch

Run the following in the root of your project:

```bash
make
```

This will:
- Print a cool ASCII logo 😎
- Create required volumes under `/home/<your-login>/data/`
- Start all containers in the background

### 🔐 HTTPS Certificate

This project uses a self-signed certificate. When accessing https://<your-login>.42.fr, you may receive a browser warning. You can safely bypass this during development.

You can log in by accesing :
```
https://<your-login>.42.fr/wp-admin
```

🚢 Welcome to the Docker world!

👨‍💻 Author
- lguerbig
