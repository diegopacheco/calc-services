#!/bin/bash

docker run --name=div-go   --rm -p 8083:6000 diegopacheco/div-go:v1 & 
docker run --name=sub-python --rm -p 8081:5000 diegopacheco/sub-python:v1 &
docker run --name=sum-rust --rm -p 8084:3000 diegopacheco/sum-rust:v1 & 
docker run --name=mul-java --rm -p 8082:8080 diegopacheco/mul-java:v1 & 