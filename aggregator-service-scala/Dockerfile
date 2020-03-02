FROM openjdk:8-jre-alpine 
RUN mkdir /app
RUN apk add --update \
    curl \
    && rm -rf /var/cache/apk/*
ADD . /app
WORKDIR /app
COPY ./target/scala-2.13/aggregate-service-scala.jar /app/app.jar 
ENTRYPOINT ["java", "-jar", "app.jar"]