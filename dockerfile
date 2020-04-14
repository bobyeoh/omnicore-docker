FROM centos
LABEL maintainer="Bob Yang<b@001.gs>"
WORKDIR /app
EXPOSE 8332
RUN yum -y install nodejs git wget vim gcc gcc-c++ autoconf automake make zlib zlib-devel libxml2 libxml2-devel openssl openssl-devel libaio libtool boost boost-devel libevent-devel
# RUN wget http://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/l/libdb4-4.8.30-13.el7.x86_64.rpm
# RUN wget http://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/l/libdb4-devel-4.8.30-13.el7.x86_64.rpm
# RUN wget http://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/l/libdb4-cxx-4.8.30-13.el7.x86_64.rpm
# RUN wget http://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/l/libdb4-cxx-devel-4.8.30-13.el7.x86_64.rpm
# RUN rpm -ivh libdb4-4.8.30-13.el7.x86_64.rpm
# RUN rpm -ivh libdb4-devel-4.8.30-13.el7.x86_64.rpm
# RUN rpm -ivh libdb4-cxx-4.8.30-13.el7.x86_64.rpm
# RUN rpm -ivh libdb4-cxx-devel-4.8.30-13.el7.x86_64.rpm
# RUN git clone https://github.com/OmniLayer/omnicore.git
# RUN /app/omnicore/autogen.sh
# RUN /app/omnicore/configure
# RUN make
# RUN make install
RUN wget https://github.com/OmniLayer/omnicore/releases/download/v0.8.1/omnicore-0.8.1-x86_64-linux-gnu.tar.gz
RUN tar -zxvf omnicore-0.8.1-x86_64-linux-gnu.tar.gz
RUN mv /app/omnicore-0.8.1 /app/omnicore
RUN mkdir /app/blockdata
ENTRYPOINT ["/app/omnicore/bin/omnicored -conf=/app/config -datadir=/app/blockdata", "--daemon"]