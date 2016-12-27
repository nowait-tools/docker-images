FROM nowait/python:2.7.12-ubuntu

RUN apt-get update && \
    apt-get install -y \
    python-setuptools \
    python-dev \
    libpq-dev \
    python-pip

CMD ["pip", "-v"]
