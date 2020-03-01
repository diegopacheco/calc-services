FROM openjdk:8-jre-alpine 
RUN mkdir /app
ADD . /app
WORKDIR /app
COPY ./build/libs/mul-service-java.jar /app/app.jar 
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]