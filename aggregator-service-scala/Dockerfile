FROM openjdk:8-jre-alpine 
RUN mkdir /app
ADD . /app
WORKDIR /app
COPY ./target/scala-2.13/aggregate-service-scala.jar /app/app.jar 
CMD ["java", "-jar", "app.jar"]