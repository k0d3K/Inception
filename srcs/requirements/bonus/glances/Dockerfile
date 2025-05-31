FROM debian:bullseye

# Set non-interactive mode for apt
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies and Glances (with web support)
RUN apt-get update && \
    apt-get install -y python3-pip python3-dev curl gcc && \
    pip3 install --no-cache-dir glances[web] && \
    apt-get remove -y gcc python3-dev && \
    apt-get autoremove -y && \
    apt-get clean

# Expose Glances web UI port
EXPOSE 61208

# Run Glances in web mode 
CMD ["glances", "-w"]
