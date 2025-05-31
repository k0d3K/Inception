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
- Build the containers image
- Create required volumes under `/home/<your-login>/data/`
- Start all containers in the background

### 🔐 HTTPS Certificate

This project uses a self-signed certificate. When accessing https://<your-login>.42.fr, you may receive a browser warning. You can safely bypass this during development.

You can log in by accessing `https://<your-login>.42.fr/wp-admin`.

---

## 🧠 Quick explanations

### What is Docker?

Docker is a platform that enables you to package and run applications in isolated environments called containers. Each container contains everything needed to run a piece of software, including code, runtime, libraries, and system tools. This makes your application portable, consistent, and easy to deploy across different environments.

### What is Docker Compose ?

Docker Compose lets you run mutiple containers togethers using just one configuration file (docker-compose.yml)
Without docker compose, you run containers manually with `docker run`, passing all options (ports, volumes, etc...) in the command line. It's repetitive and hard to manage.
With docker compose, everything (images, volumes, networks, env variables) is described in one YAML file, and you start everything with one command, `docker-compose up`.

### Containers used in this project

- **Nginx**:
	This is the web server. It handles all the requests from your browser, shows static files like images, and sends PHP requests to the WordPress container. It also makes sure your website uses HTTPS (secure connection).

- **MariaDB**:
	This is the database. It stores all the data for your WordPress site, like posts, user accounts, and settings.

- **WordPress (with PHP-FPM)**:
	This runs the WordPress software that creates your website. It uses PHP to generate pages and talks to the MariaDB database to get the data it needs.

- **Redis (optional bonus)**:
	This is a fast memory storage used to keep temporary data. It helps make your website faster by reducing how often WordPress needs to ask the database for information.

- **FTP server (optional bonus)**:
	Lets you download, upload and manage files on your WordPress site using the FTP protocol.

- **Adminer (optional bonus)**:
	A simple web tool to manage your database. It lets you look at and change your MariaDB data through your browser.

- **Glances (optional bonus)**:
	Glances is a light real-time performance monitoring tool. It helps you visualize and troubleshoot what's happening in your containers, system, and applications.

All these containers work together inside Docker, each doing their own job but talking to each other so your website runs smoothly.

---

## ✅ Test everything

### 🌐 Manda

Connect to `<your-login>.42.fr` on firefox. It handles self-signed certificates best.
You will see a warning "Potential Security Risk Ahead" due to self-signed certificate, you can safely click on `Advanced...` and then `Accept the Risk and Continue`.

To acces the SQL database, you first need to be able to execuite commands in the mariadb container. To do so, run:
```
docker exec -it mariadb bash 
```
Once you in the mariadb container, you can log in the database with the following command:
```
mysql -u<user> -p<password>
```
Then, you can check you wordpress database is present with the following SQL command:
```
SHOW DATABASES;
```
You can acces it trought:
```
USE wordpress;
```
Then you can check content with:
```
SHOW TABLES;
```

### Redis cache system

To check that the Redis chache system is working properly you can ping the server inside the Redis container:
```
docker exec -it redis sh
redis-cli -h redis ping
```
You should see “PONG” if the Redis server is responding properly.

### FTP server

You can access the FTP server with:
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
The `ls` command can then list the files in the server current directory.

### Adminer

You can access it trought:
```
https://<your-login>.42.fr/adminer
```
In the login form, enter:
	- System: MySQL
	- Server: mariadb
	- Username: <your-login>
	- Password: 1234
	- Database: wordpress

### Glances

You can access it trought:
```
https://<your-login>.42.fr/glances
```
Login and explore live performance metrics.

### My own web static page

You can see the README of this project by acceesing:
```
https://<your-login>.42.fr/index.htlm
```

---

🚢 Welcome to the Docker world!

👨‍💻 Author
- lguerbig
