FROM centos
LABEL maintainer="Bob Yang<b@001.gs>"
WORKDIR /app
EXPOSE 8332

RUN yum -y install epel-release
RUN yum install -y autoconf automake boost-devel gcc-c++ git libdb4-cxx libdb4-cxx-devel libevent-devel libtool openssl-devel wget
RUN git clone https://github.com/OmniLayer/omnicore.git
RUN /app/omnicore/autogen.sh
RUN /app/omnicore/configure
RUN make
ENTRYPOINT ["/app/omnicore/src/omnicored", "--daemon"]