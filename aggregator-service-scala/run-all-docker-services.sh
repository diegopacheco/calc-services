#!/bin/bash

docker run --name=div-go   --rm -p 6000:8083 diegopacheco/div-go:v1 & 
docker run --name=sub-python --rm -p 5000:8081 diegopacheco/sub-python:v1 &
docker run --name=sum-rust --rm -p 3000:8084 diegopacheco/sum-rust:v1 & 
docker run --name=mul-java --rm -p 8080:8082 diegopacheco/mul-java:v1 & 