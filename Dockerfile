FROM openjdk:8

# Install mc
WORKDIR /root
RUN wget https://dl.minio.io/client/mc/release/linux-amd64/mc && mv mc /usr/local/bin/mc && chmod a+x /usr/local/bin/mc
ENV MINIO_ENDPOINT http://localhost:9000
ENV MINIO_ACCESS_KEY KEY
ENV MINIO_SECRET_KEY KEY
ENV MINIO_BUCKET_NAME dcos-backup

# Install guano: https://github.com/feldoh/guano
ENV GUANO_VERSION=0.1a
WORKDIR /root
RUN mkdir -p /root/guano && cd /root/guano && wget -O guano-0.1a.jar https://bintray.com/feldoh/Guano/download_file?file_path=jar%2Fguano-${GUANO_VERSION}.jar && ln -sf guano-${GUANO_VERSION}.jar guano.jar

# Target Zookeeper
ENV ZOOKEEPER_URL localhost:2181
ENV ZOOKEEPER_ZNODE /
ENV TMP_DIR /tmp/dcos

WORKDIR /
ADD docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod a+x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
