FROM openjdk:8-jre

COPY target/*.jar /app.jar

HEALTHCHECK --interval=10s --timeout=10s --retries=10 CMD http_proxy= curl --silent --fail http://localhost:8080/health

EXPOSE 8080 5005

ENTRYPOINT [ "java" , "-jar", "/app.jar" ]