FROM tomcat:9
COPY /home/ubuntu/.jenkins/workspace/pipeline/webapp/target/webapp.war /usr/local/tomcat9/webapps/
