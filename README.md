# dcos-zk-backup
Backup zookeeper znode to Minio.

# Container build
```
$ docker-compose build
```

# Env variables
* Storage(Minio)
 * MINIO_ENDPOINT http://localhost:9000
 * MINIO_ACCESS_KEY <YOUR_KEY>
 * MINIO_SECRET_KEY <YOUR_KEY>
 * MINIO_BUCKET_NAME dcos-backup

* Target Zookeeper 
 * ZOOKEEPER_URL localhost:2181
 * ZOOKEEPER_ZNODE /
 * TMP_DIR /tmp/dcos

# Test drive
* Edit `docker-compose.yml` for env variables.
* Run!
```
$ docker-compose up
```

# Using Metronome Scheduler on DC/OS
* Edit `metronome.json` and make a job on DC/OS.
  
