# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM eclipse-temurin:8-focal

COPY ./files /

RUN set -xeu && \
    ln -snf /usr/bin/bash /usr/bin/sh && \
    sed -i s/archive.ubuntu.com/mirrors.aliyun.com/g /etc/apt/sources.list && \
    sed -i s/security.ubuntu.com/mirrors.aliyun.com/g /etc/apt/sources.list && \
    \
    apt-get update -q && \
    apt-get install -yq busybox python3-pip supervisor && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir /opt/busybox && \
    busybox --install /opt/busybox

ENV PATH="${PATH}:/opt/busybox"
