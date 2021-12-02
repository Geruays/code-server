#
# Ubuntu Desktop (LXDE) Dockerfile
#
# https://github.com/dockerfile/ubuntu-desktop
#

# Pull base image.
FROM ghcr.io/linuxserver/baseimage-ubuntu:focal

# Install LXDE and VNC server.
RUN curl -fsSL https://get.docker.com -o get-docker.sh
RUN sh get-docker.sh
RUN docker run -d \
  --name=code-server \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/London \
  -e PASSWORD=netflex `#optional` \
  -e SUDO_PASSWORD=netflex `#optional` \
  -p 8080:8080 \
  -v /path/to/appdata/config:/config \
  --restart unless-stopped \
  lscr.io/linuxserver/code-server

# Define default command.
CMD ["bash"]

# Expose ports.
EXPOSE 8080
