# Set Mirror:
APACHE_MIRROR=mirrors.cloud.tencent.com/apache

SELF_DIR="$(cd "$(dirname "$0")"; pwd)"

source "${SELF_DIR}/.env"

if [ $(uname -m) = "aarch64" ]; then HADOOP_TAR_NAME=hadoop-${HADOOP_VERSION}-aarch64; else HADOOP_TAR_NAME=hadoop-${HADOOP_VERSION}; fi
wget -P "${SELF_DIR}/download" ${APACHE_MIRROR}/hadoop/core/hadoop-${HADOOP_VERSION}/${HADOOP_TAR_NAME}.tar.gz
wget -P "${SELF_DIR}/download" ${APACHE_MIRROR}/hive/hive-${HIVE_VERSION}/apache-hive-${HIVE_VERSION}-bin.tar.gz
wget -P "${SELF_DIR}/download" ${APACHE_MIRROR}/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop3.tgz
