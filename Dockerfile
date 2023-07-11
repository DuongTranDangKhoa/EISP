FROM maven:3.8.5-openjdk-18 as build
WORKDIR /app
ADD pom.xml .
COPY . .
RUN mvn package

FROM tomcat:10.1.11-jdk21-openjdk-bookworm
ARG ARTIFACT=demo.war
COPY --from=build /app/target/${ARTIFACT} /usr/local/tomcat/webapps