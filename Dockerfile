FROM python:3
COPY . /packages
WORKDIR /packages
RUN wget https://dl.google.com/go/go1.12.6.linux-amd64.tar.gz \
  && tar -xvf go1.12.6.linux-amd64.tar.gz && mv go /usr/local 
ENV GOROOT /usr/local/go
ENV GOPATH $HOME/Projects/Proj1
ENV PATH $GOPATH/bin:$GOROOT/bin:$PATH
RUN bash ./install-osint.sh
