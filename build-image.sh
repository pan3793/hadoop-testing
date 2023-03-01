#!/usr/bin/env bash
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Set Mirror:
APACHE_MIRROR=mirrors.cloud.tencent.com/apache
MAVEN_MIRROR=mirrors.cloud.tencent.com/maven

set -e

APACHE_MIRROR=${APACHE_MIRROR:-https://dlcdn.apache.org}
MAVEN_MIRROR=${MAVEN_MIRROR:-https://maven-central-asia.storage-download.googleapis.com/maven2}
BUILD_CMD="docker build"

if [ $BUILDX ]; then
  echo "Using buildx to build cross-platform images"
  BUILD_CMD="docker buildx build --platform=linux/amd64,linux/arm64 --push"
fi

SELF_DIR="$(cd "$(dirname "$0")"; pwd)"

source "${SELF_DIR}/.env"

${BUILD_CMD} \
  --build-arg APACHE_MIRROR=${APACHE_MIRROR} \
  --build-arg MAVEN_MIRROR=${MAVEN_MIRROR} \
  --file "${SELF_DIR}/centos7-java8/Dockerfile" \
  --tag hadoop-testing/centos7-java8:${PROJECT_VERSION} \
  "${SELF_DIR}/centos7-java8" $@

${BUILD_CMD} \
  --build-arg APACHE_MIRROR=${APACHE_MIRROR} \
  --build-arg MAVEN_MIRROR=${MAVEN_MIRROR} \
  --build-arg PROJECT_VERSION=${PROJECT_VERSION} \
  --file "${SELF_DIR}/kerberos/Dockerfile" \
  --tag hadoop-testing/kerberos:${PROJECT_VERSION} \
  "${SELF_DIR}/kerberos" $@
