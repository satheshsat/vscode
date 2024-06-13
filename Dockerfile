# Use the official Ubuntu image as the base image
FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV CODE_SERVER_VERSION=4.13.0

# Install necessary packages
RUN apt-get update && apt-get install -y \
    curl \
    sudo \
    gnupg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Add code-server repository and install code-server
RUN curl -fsSL https://code-server.dev/install.sh | sh -s -- --version $CODE_SERVER_VERSION

# Create a user for code-server
RUN useradd -m coder \
    && echo 'coder ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Switch to the new user
USER coder
WORKDIR /home/coder

# Expose the port code-server will run on
EXPOSE 8080

# Copy the entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN sudo chmod +x /entrypoint.sh

# Entry point
ENTRYPOINT ["/entrypoint.sh"]
