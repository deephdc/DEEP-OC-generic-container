FROM ubuntu:18.04
LABEL maintainer="Alvaro Lopez Garcia <aloga@ifca.unican.es>"
LABEL version="0.2"
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

# We can use pip or pip3, depending on the python version that we want to use
RUN git clone https://github.com/indigo-dc/deepaas && \
    cd deepaas && \
    pip3 install .

RUN git clone https://github.com/alvarolopez/flask-openwhisk && \
    cd flask-openwhisk && \
    pip3 install .

EXPOSE 5000

CMD deepaas-run --listen-ip 0.0.0.0

ADD __main__.py /action/exec
RUN chmod 755 /action/exec

ENV FLASK_PROXY_PORT 8080

RUN pip3 install --no-cache-dir gevent==1.2.1

RUN mkdir -p /actionProxy
ADD actionproxy.py /actionProxy/

CMD ["/bin/bash", "-c", "cd /actionProxy && python3 -u actionproxy.py"]
