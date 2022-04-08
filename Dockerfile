FROM openjdk:8
ADD target/addressbook.war addressbook.war
EXPOSE 8081
ENTRYPOINT ["java", "-jar", "addressbook.war"]
