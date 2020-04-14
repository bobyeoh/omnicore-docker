FROM centos
LABEL maintainer="Bob Yang<b@001.gs>"
WORKDIR /app
EXPOSE 8332-8333/tcp 18332-18333/tcp
RUN yum -y install git wget
RUN wget https://github.com/OmniLayer/omnicore/releases/download/v0.8.1/omnicore-0.8.1-x86_64-linux-gnu.tar.gz
RUN tar -zxvf omnicore-0.8.1-x86_64-linux-gnu.tar.gz
RUN mv /app/omnicore-0.8.1 /app/omnicore
RUN /app/omnicore/bin/omnicored --datadir=/app/blockdata --conf=/app/config
ENTRYPOINT ["/app/omnicore/bin/omnicored --datadir=/app/blockdata --conf=/app/config", "--daemon"]