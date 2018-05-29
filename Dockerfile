FROM ubuntu:18.04
LABEL maintainer="Alvaro Lopez Garcia <aloga@ifca.unican.es>"
LABEL version="0.1"
LABEL description="DEEP as a Service Generic Container"

RUN apt-get update && \
    apt-get upgrade -y

RUN apt-get install -y --no-install-recommends \
        git \
        curl \
        python-setuptools \
        python-pip \
        python-wheel

WORKDIR /srv

# TODO(aloga): use PyPi whenever possible
RUN git clone https://github.com/IFCA/deepaas && \
    cd deepaas && \
    pip install .

EXPOSE 5000

CMD deepaas-run
