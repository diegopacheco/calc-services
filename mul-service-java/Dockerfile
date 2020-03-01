FROM openjdk:8-jre-alpine 
RUN mkdir /app
ADD . /app
WORKDIR /app
COPY ./build/libs/mul-service-java.jar /app/app.jar 
CMD ["java", "-jar", "app.jar"]