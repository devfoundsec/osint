FROM python:3
COPY . /packages/src
WORKDIR /workspace
RUN wget https://dl.google.com/go/go1.12.6.linux-amd64.tar.gz \
  && tar -xvf go1.12.6.linux-amd64.tar.gz && mv go /usr/local \
  && apt-get update -y && apt-get install python2.7 -y \
  && wget -O- -q https://bootstrap.pypa.io/get-pip.py | python2.7
ENV GOROOT /usr/local/go
ENV GOPATH $HOME/Projects/Proj1
ENV PATH /Projects/Proj1/bin:/usr/local/go/bin:/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/.local/bin:/packages/src/:/packages/src/*/
RUN bash /packages/src/install-osint.sh
