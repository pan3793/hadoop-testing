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

ARG PROJECT_VERSION
FROM hadoop-testing/ubuntu-focal-java8:$PROJECT_VERSION

# COPY CONFIGURATION
COPY ./files /

# INSTALL KERBEROS
RUN apt-get update -q && \
    apt-get install -yq krb5-kdc krb5-admin-server krb5-user && \
    rm -rf /var/lib/apt/lists/*

# CREATE KERBEROS DATABASE
RUN /usr/sbin/kdb5_util create -s -P password

# CREATE ANOTHER KERBEROS DATABASE
RUN /usr/sbin/kdb5_util create -d /var/kerberos/krb5kdc/principal-other -r OTHER.APACHE.ORG -s -P password

# MAKE '.APACHE.ORG' TRUST 'OTHER.APACHE.ORG'
RUN /usr/sbin/kadmin.local -q "addprinc -pw 123456 krbtgt/.APACHE.ORG@OTHER.APACHE.ORG"
RUN /usr/sbin/kadmin.local -r OTHER.APACHE.ORG -d /var/kerberos/krb5kdc/principal-other -q "addprinc -pw 123456 krbtgt/APACHE.ORG"

# EXPOSE KERBEROS PORTS
EXPOSE	88
EXPOSE	89
EXPOSE	749

CMD ["supervisord", "-c", "/etc/supervisord.conf"]
ENTRYPOINT  ["/opt/entrypoint.sh"]
