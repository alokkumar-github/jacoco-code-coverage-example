FROM openjdk:8-jdk-alpine
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
RUN mkdir -p /appl/
WORKDIR /appl
ENV JAVA_OPTS=-javaagent:/appl/isa/tmp/jacocoagent.jar=destfile=/appl/isa/tmp/jacoco-it.exec,output=file -XX:+UseContainerSupport
COPY 
ENTRYPOINT ["java","-jar","/app.jar"]
