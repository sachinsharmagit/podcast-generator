FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
  python3.10 \
  python3-pip \
  git

RUN pip3 install PyYAML --break-system-packages

COPY feed.py /usr/bin/feed.py
RUN chmod +x /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

RUN git config --global --add safe.directory /github/worksapce

ENTRYPOINT ["/entrypoint.sh"]
