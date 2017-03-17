#!/bin/bash
TODAY=`date +%Y%m%d`
echo "Backup start for ${TODAY}..."

## Backup target zookeeper to tmp dir
java -jar /root/guano/guano.jar -s "${ZOOKEEPER_URL}" -o "${TMP_DIR}" -d "${ZOOKEEPER_ZNODE}"
echo "ZK node ${ZOOKEEPER_ZNODE} downloaded to ${TMP_DIR}"

## Tar dir
tar -czvf dcos-zookeeper-backup-${TODAY}.tar.gz /tmp/dcos
echo "Create tarball: dcos-zookeeper-backup-${TODAY}.tar.gz"

## Upload to minio
### Config first
mc config host add minio ${MINIO_ENDPOINT} ${MINIO_ACCESS_KEY} ${MINIO_SECRET_KEY} S3v4
mc cp --quiet dcos-zookeeper-backup-${TODAY}.tar.gz minio/${MINIO_BUCKET_NAME}/dcos-zookeeper-backup-${TODAY}.tar.gz
echo "Uploaded tarball to ${MINIO_ENDPOINT}/${MINIO_BUCKET_NAME}/dcos-zookeeper-backup-${TODAY}.tar.gz"
echo "Backup done."

