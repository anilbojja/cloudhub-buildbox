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

# clean all cache to clean space
# TODO enable me
# RUN yum clean all

# default command
#CMD ["java"]
