#
# Ubuntu Desktop (LXDE) Dockerfile
#
# https://github.com/dockerfile/ubuntu-desktop
#

# Pull base image.
FROM dockerfile/ubuntu

# Install LXDE and VNC server.
RUN \
  apt-get update && \
  sudo apt -y install novnc websockify python-numpy \
  cd /etc/ssl \
  openssl genrsa -des3 -passout pass:x -out novnc.pem 2048 \
  chmod 644 novnc.pem \
  websockify -D --web=/usr/share/novnc/ --cert=/etc/ssl/novnc.pem 6080 localhost:5901\
  DEBIAN_FRONTEND=noninteractive apt-get install -y lxde-core lxterminal tightvncserver && \
  rm -rf /var/lib/apt/lists/*

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["bash"]

# Expose ports.
EXPOSE 6080
EXPOSE 5901
