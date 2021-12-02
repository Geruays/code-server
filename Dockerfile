#
# Ubuntu Desktop (LXDE) Dockerfile
#
# https://github.com/dockerfile/ubuntu-desktop
#

# Pull base image.
FROM node:16

# Install LXDE and VNC server.
RUN \
  curl -fsSL https://code-server.dev/install.sh | sh -s -- --dry-run
  
  
# Define working directory.
WORKDIR /data

# Define default command.
CMD ["bash"]

# Expose ports.
EXPOSE 8443
