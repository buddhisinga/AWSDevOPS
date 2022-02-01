FROM tomcat
RUN rm -rf /usr/local/tomcat/webapps/webapp
COPY target/webapp.war /usr/local/tomcat/webapps/webapp.war
