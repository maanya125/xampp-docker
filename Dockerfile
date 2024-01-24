# Build with:
# 	docker build -t cswl/xampp 

# Use an official Ubuntu image as the base
FROM ubuntu:latest

# Install necessary dependencies
RUN apt-get update \
    && apt-get install -y wget

# Download and rename XAMPP installer
RUN wget https://webwerks.dl.sourceforge.net/project/xampp/XAMPP%20Linux/8.2.12/xampp-linux-x64-8.2.12-0-installer.run -O /tmp/my-xampp-installer.run \
    && chmod +x /tmp/my-xampp-installer.run \
    && /tmp/my-xampp-installer.run --mode unattended --installer-language en

# Expose necessary ports
EXPOSE 80 443

# Start XAMPP on container startup
CMD ["/opt/lampp/lampp", "start", "--foreground"]
