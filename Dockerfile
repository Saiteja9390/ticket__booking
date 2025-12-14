# Tomcat 11 with Java 21 (latest valid)
FROM tomcat:11.0-jdk21-temurin

# Remove default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR and rename it to ROOT.war so it loads at "/"
COPY ticketbooking2.war /usr/local/tomcat/webapps/ROOT.war

# Expose port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
