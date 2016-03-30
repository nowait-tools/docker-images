#! /bin/sh
case "$1" in
  '')
    exec java -jar /opt/jenkins/jenkins.war ;;
  -*)
    exec java -jar /opt/jenkins/jenkins.war "$@" ;;
  *)
    exec "$@" ;;
esac
