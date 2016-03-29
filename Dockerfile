FROM alpine:latest
MAINTAINER daicho


ENV JENKINS_HOME /var/jenkins_home
ENV JENKINS_VERSION 1.642.2
#ENV JENKINS_HOME /usr/local/jenkins

RUN apk --update add openjdk7 ttf-dejavu &&\
    rm -rf /var/cache/apk/*

RUN adduser -D -h "$JENKINS_HOME" -u 1000  -s /bin/bash jenkins

#RUN mkdir -p /usr/local/jenkins
#RUN adduser -D -H -s /bin/sh jenkins
#RUN chown -R jenkins:jenkins /usr/local/jenkins/
ADD http://repo.jenkins-ci.org/public/org/jenkins-ci/main/jenkins-war/${JENKINS_VERSION}/jenkins-war-${JENKINS_VERSION}.war /usr/share/jenkins/jenkins.war
#ADD http://mirrors.jenkins-ci.org/war-stable/latest/jenkins.war /usr/local/jenkins/jenkins.war
RUN chmod 644 /usr/share/jenkins/jenkins.war

VOLUME /usr/local/jenkins
ENTRYPOINT ["java", "-jar", "/usr/share/jenkins/jenkins.war"]
EXPOSE 8080
CMD [""]
