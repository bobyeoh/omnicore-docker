FROM ubuntu
LABEL maintainer="Bob Yang<b@001.gs>"
WORKDIR /app
EXPOSE 8332

RUN apt-get update
RUN apt-get -y install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils python3
RUN apt-get -y install libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev
RUN apt-get -y install software-properties-common
RUN apt-get -y install libdb4.8-dev libdb4.8++-dev
RUN git clone https://github.com/OmniLayer/omnicore.git
RUN /app/omnicore/autogen.sh
RUN /app/omnicore/configure
RUN make
ENTRYPOINT ["/app/omnicore/src/omnicored", "--daemon"]