FROM openjdk:8
ADD target/adressbook.war adressbook.war
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "adressbook.war"]
