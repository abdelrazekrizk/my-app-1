FROM tomcat:8.5.73-jre8-temurin-focal

## Step 1:
# Copy source code to working directory
ADD ./sample.war /usr/local/tomcat/webapps/

## Step 3:
# Expose port 8787
EXPOSE 8080

## Step 5:
# Run web app at container launch

CMD ["catalina.sh", "run"]