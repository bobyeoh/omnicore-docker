FROM ubuntu
LABEL maintainer="Bob Yang<b@001.gs>"
WORKDIR /app
EXPOSE 8332

RUN apt-get update
RUN apt-get -y install git
RUN apt-get -y install pkg-config
RUN apt-get -y install autoconf
RUN apt-get -y install libtool
RUN apt-get -y install libdb4.8-dev libdb4.8++-dev
RUN git clone https://github.com/OmniLayer/omnicore.git
RUN /app/omnicore/autogen.sh
RUN /app/omnicore/configure
RUN make
ENTRYPOINT ["/app/omnicore/src/omnicored", "--daemon"]