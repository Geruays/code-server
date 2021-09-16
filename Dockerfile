RUN \
  sudo docker run --rm -d -p 6080:80 -v $PWD:/workspace:rw -e USER=username -e PASSWORD=password -e RESOLUTION=1680x1050 --name ubuntu-novnc fredblgr/ubuntu-novnc:20.04
