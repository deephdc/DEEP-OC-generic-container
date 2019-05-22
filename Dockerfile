FROM bitnami/minideb
LABEL maintainer="Alvaro Lopez Garcia <aloga@ifca.unican.es>"
LABEL version="0.8.0"
LABEL description="DEEP as a Service Generic Container"

RUN apt-get update && \
    apt-get upgrade -y

RUN apt-get install -y --no-install-recommends \
        git \
        curl \
        python-setuptools \
        python-pip \
        python-wheel \
        python3-setuptools \
        python3-pip \
        python3-wheel

WORKDIR /srv

# Install rclone
RUN curl https://downloads.rclone.org/rclone-current-linux-amd64.deb --output rclone-current-linux-amd64.deb && \
    dpkg -i rclone-current-linux-amd64.deb && \
    apt-get install -f && \
    rm rclone-current-linux-amd64.deb

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /root/.cache/pip/* && \
    rm -rf /tmp/*

# We can use pip or pip3, depending on the python version that we want to use
RUN pip3 install 'deepaas>=0.3.0' && \
    pip install 'deepaas>=0.3.0'

# Add environment variables so that we can change the ports exposed, although
# this should not be modified
ENV API_PORT=5000
ENV API_IP=0.0.0.0

# If the operator changes the port above the expose will still be the port
# 5000, unless they expose the new port as well.
EXPOSE $API_PORT

CMD ["sh", "-c", "deepaas-run --openwhisk --listen-ip 0.0.0.0"]
