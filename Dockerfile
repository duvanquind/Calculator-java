FROM openjdk:17
RUN mkdir /calculadora
WORKDIR /calculadora
COPY DownloadPipelineArtifact@2/s-0.0.1-SNAPSHOT.jar calculadora.jar
#COPY build/libs/Calculadora-0.0.1-SNAPSHOT.jar calculadora.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar","calculadora.jar"]
