FROM nowait/python:2.7.12-2-cli-ubuntu

RUN apt-get update && \
    apt-get install -y \
    python-setuptools \
    python-dev \
    libpq-dev \
    libxml2-dev \
    libxslt1-dev \
    python-pip && \
    pip install --upgrade pip

ENTRYPOINT ["su-exec-entrypoint"]
CMD ["pip", "-v"]
