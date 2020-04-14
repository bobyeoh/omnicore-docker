FROM ubuntu
LABEL maintainer="Bob Yang<b@001.gs>"
EXPOSE 8332

RUN apt-get update
RUN apt-get -y install git
RUN apt-get -y install pkg-config
RUN apt-get -y install autoconf
RUN cd /
RUN mkdir app
RUN cd /app
RUN git clone https://github.com/OmniLayer/omnicore.git
RUN cd omnicore/
RUN ls
RUN ./app/omnicore/autogen.sh
RUN ./app/omnicore/configure
RUN make
ENTRYPOINT ["/app/omnicore/src/omnicored", "--daemon"]