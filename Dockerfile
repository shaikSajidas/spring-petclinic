# building(packaging) application
FROM maven:3-openjdk-11 AS builder
RUN apt install git
RUN git clone https://github.com/shaikSajidas/spring-petclinic.git && cd spring-petclinic && mvn clean package

# building application image
FROM openjdk:11
COPY --from=builder /spring-petclinic/target/spring-petclinic-2.7.0-SNAPSHOT.jar /spring-petclinic-2.7.0-SNAPSHOT.jar
EXPOSE 8080/tcp
CMD ["java", "-jar", "/spring-petclinic-2.7.0-SNAPSHOT.jar"]

