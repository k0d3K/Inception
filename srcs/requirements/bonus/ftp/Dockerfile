FROM debian:bullseye

# Install necessary packages
RUN apt update -y && apt upgrade -y && apt install -y vsftpd openssl openssh-server

# Copy the startup script
COPY ./tools/script.sh /

# Copy the config
COPY ./conf/vsftpd.conf /etc/vsftpd.conf

# Make the script executable
RUN chmod +x ./script.sh

# Start the script
CMD ["./script.sh"]