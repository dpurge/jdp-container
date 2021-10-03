#! /bin/bash -e

: "${JENKINS_WAR:="/usr/share/jenkins/jenkins.war"}"
: "${JENKINS_HOME:="/var/lib/jenkins"}"
: "${JENKINS_PORT:=8080}"
: "${JENKINS_SLAVE_AGENT_PORT:=50000}"

if [[ $# -lt 1 ]] || [[ "$1" == "--"* ]]; then
  exec /bin/java -Djava.awt.headless=true -Djenkins.model.Jenkins.slaveAgentPort="${JENKINS_SLAVE_AGENT_PORT}" -Duser.home="${JENKINS_HOME}" -jar ${JENKINS_WAR} --webroot=/var/cache/jenkins/war --httpPort="${JENKINS_PORT}" "$@"
fi

# user wants to run his own process
exec "$@"
