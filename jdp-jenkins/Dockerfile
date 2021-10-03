FROM ubuntu:20.04

RUN apt-get update; \
	apt-get install -y --no-install-recommends \
		ca-certificates \
		wget \
		gnupg \
	; \
	echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list; \
	wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | apt-key add - ; \
    apt-get update; \
	apt-get install -y --no-install-recommends \
		git \
		gawk \
		bzip2 \
		default-jdk \
		jenkins \
		tini \
	; \
	rm -rf /var/lib/apt/lists/*

ENV JENKINS_HOME /var/lib/jenkins
ENV JENKINS_PORT 8080
ENV JENKINS_SLAVE_AGENT_PORT 50000

VOLUME $JENKINS_HOME

EXPOSE $JENKINS_PORT
EXPOSE $JENKINS_SLAVE_AGENT_PORT

COPY tinistart.sh /usr/bin/tinistart.sh
RUN chown -R jenkins "$JENKINS_HOME"


USER jenkins
ENTRYPOINT ["/usr/bin/tini", "--", "/usr/bin/tinistart.sh"]
