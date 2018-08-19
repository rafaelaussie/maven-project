FROM tomcat:8.0

ADD ./webapp/*.war /usr/local/tomcat/

EXPOSE 8080

CMD ["catalina.sh", "run"]