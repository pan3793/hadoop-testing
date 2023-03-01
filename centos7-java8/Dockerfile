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

FROM centos:7

COPY ./files /

RUN set -xeu && \
    yum install -y nc wget less ne-tools sudo telnet vim jq && \
    \
    # Install OpenJDK 8 \
    yum install -y java-1.8.0-openjdk-devel && \
    \
    # install supervisor
    yum --enablerepo=extras install -y setuptools epel-release && \
    yum install -y python-pip supervisor && \
    \
    # cleanup
    yum -y clean all && rm -rf /tmp/* /var/tmp/*

ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk
ENV PATH="${JAVA_HOME}/bin:${PATH}"
ENV LANG=en_US.UTF-8
