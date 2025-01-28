FROM cschranz/gpu-jupyter:v1.8_cuda-12.5_ubuntu-22.04

# Switch to root to perform installations and configurations
USER root

# Install OpenSSH server
RUN apt-get update && apt-get install -y openssh-server && apt-get clean

# Set root password for SSH access
RUN echo "root:rootpassword123!" | chpasswd

# Allow root login via SSH
RUN sed -i 's/^#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    echo "PermitEmptyPasswords no" >> /etc/ssh/sshd_config

# Ensure SSH daemon can run properly
RUN mkdir -p /run/sshd

# Generate SSH host keys
RUN ssh-keygen -A

# Expose necessary ports
EXPOSE 8888 22

# Copy custom entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Use the custom entrypoint script
ENTRYPOINT ["/entrypoint.sh"]
