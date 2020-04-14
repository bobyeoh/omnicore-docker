FROM centos
LABEL maintainer="Bob Yang<b@001.gs>"
WORKDIR /app
EXPOSE 8332
RUN yum -y install nodejs git wget vim goaccess gcc gcc-c++ autoconf automake make pcrepcre-devel zlib zlib-devel libxml2 libxml2-devel openssl openssl-devel gdlibjpeg libjpeg-devel libpng libpng-devel libaio libtool boost boost-devel libevent-devel
RUN wget http://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/l/libdb4-4.8.30-13.el7.x86_64.rpm
RUN wget http://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/l/libdb4-devel-4.8.30-13.el7.x86_64.rpm
RUN wget http://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/l/libdb4-cxx-4.8.30-13.el7.x86_64.rpm
RUN wget http://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/l/libdb4-cxx-devel-4.8.30-13.el7.x86_64.rpm
RUN rpm -ivh libdb4-4.8.30-13.el7.x86_64.rpm
RUN rpm -ivh libdb4-devel-4.8.30-13.el7.x86_64.rpm
RUN rpm -ivhlibdb4-cxx-4.8.30-13.el7.x86_64.rpm
RUN rpm -ivhlibdb4-cxx-devel-4.8.30-13.el7.x86_64.rpm
RUN git clone https://github.com/OmniLayer/omnicore.git
RUN /app/omnicore/autogen.sh
RUN /app/omnicore/configure
RUN make
RUN make install
ENTRYPOINT ["/app/omnicore/src/omnicored", "--daemon"]