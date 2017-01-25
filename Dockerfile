FROM amazonlinux

# install curl
RUN yum -y install unzip nc

# Download Oracle JDK
RUN curl -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u51-b16/jdk-8u51-linux-x64.rpm  > /tmp/oracle-jdk-linux-x64.rpm && \
    yum install -y /tmp/oracle-jdk-linux-x64.rpm

# download Java Cryptography Extension
RUN cd /tmp/ && \
    curl -LO "http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip" -H 'Cookie: oraclelicense=accept-securebackup-cookie' && \
    unzip jce_policy-8.zip && \
    rm jce_policy-8.zip && \
    yes |cp -v /tmp/UnlimitedJCEPolicyJDK8/*.jar /usr/java/default/jre/lib/security/

ENV JAVA_HOME /usr/java/default

#Maven
ENV MAVEN_VERSION 3.3.9
ENV MAVEN_URL http://ftp.halifax.rwth-aachen.de
ENV MAVEN_PKG ${MAVEN_URL}/apache/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz
ENV MAVEN_HOME /opt/apache-maven-${MAVEN_VERSION}
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:${MAVEN_HOME}/bin

WORKDIR /opt

RUN curl ${MAVEN_PKG} | tar xz

# mount point
RUN mkdir -p {/source,/config}
VOLUME  ["/source","/config"]

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

WORKDIR /source
# clean all cache to clean space
# TODO enable me
# RUN yum clean all

# default command
#CMD ["java"]
