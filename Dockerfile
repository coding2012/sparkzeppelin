FROM gettyimages/spark:2.1.0-hadoop-2.7

ENV SPARK_VERSION=2.1.0
ENV LIVY_VERSION=0.3.0
ENV LIVY_FILE=livy-server-$LIVY_VERSION
ENV LIVY_HOME=/usr/$LIVY_FILE

WORKDIR /usr
RUN curl -OL http://archive.cloudera.com/beta/livy/$LIVY_FILE.zip
RUN unzip $LIVY_FILE.zip
WORKDIR $LIVY_HOME
RUN mkdir logs

ENV ZEPPELIN_HOME /usr/zeppelin
WORKDIR /usr
RUN curl -OL http://apache.cs.utah.edu/zeppelin/zeppelin-0.7.0/zeppelin-0.7.0-bin-netinst.tgz
RUN tar -xvzf zeppelin-0.7.0-bin-netinst.tgz
RUN mv zeppelin-0.7.0-bin-netinst zeppelin
ENV ZEPPELIN_PORT=8081
EXPOSE 8081

RUN apt-get update \
    && apt-get -y install r-base \
    && rm -rf /var/lib/apt/lists/*
