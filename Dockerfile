FROM openjdk:17
RUN mkdir /calculadora
WORKDIR /calculadora
COPY Artifact-devsevops-app-demo/build/libs/Demo_DevSecOps-0.0.1-SNAPSHOT.jar calculadora.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar","calculadora.jar"]
