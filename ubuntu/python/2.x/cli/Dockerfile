FROM nowait/ubuntu:16.04

ENV PYTHONPATH=/src/vendor/lib/python2.7/site-packages:$PYTHONPATH

RUN apt-get update && \
    apt-get install -y \
    build-essential \
    python=2.7.11-1 \
    gettext

CMD ["python", "--version"]
