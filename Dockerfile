FROM golang:1.12.7-alpine
COPY . /packages/src
WORKDIR /workspace
RUN apk update && apk add python2 python3 git bash gcc g++ libxslt-dev freetds-dev python3-dev python2-dev openssl-dev musl-dev libffi-dev \
  && wget https://bootstrap.pypa.io/get-pip.py -O- | python2.7 \
  && wget https://bootstrap.pypa.io/get-pip.py -O- | python3.7 \
  && wget -O /packages/src/geckodriver.tar.gz https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-linux64.tar.gz \
  && tar -C /packages/src/ -xvf /packages/src/geckodriver.tar.gz \
  && rm -rf *tar.gz
ENV PATH /usr/local/bin:/usr/local/sbin:/usr/sbin:/usr/bin:/sbin:/bin:/root/.local/bin:/packages/src:/usr/local/go/bin
RUN bash /packages/src/install-osint.sh
ENTRYPOINT /bin/bash
