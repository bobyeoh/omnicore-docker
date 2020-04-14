FROM ubuntu
LABEL maintainer="Bob Yang<b@001.gs>"
WORKDIR /app
EXPOSE 8332

RUN apt-get update
RUN apt-get -y install git
RUN apt-get -y install pkg-config
RUN apt-get -y install autoconf

RUN cd /app
RUN git clone https://github.com/OmniLayer/omnicore.git
RUN cd omnicore/
RUN ./autogen.sh
RUN ./configure
RUN make
ENTRYPOINT ["/app/omnicore/src/omnicored", "--daemon"]