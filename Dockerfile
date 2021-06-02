FROM tomcat:latest

ADD ./target/LoginWebApp-1.war /home/ec2-user/apache-tomcat-9.0.46/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]
