#!/bin/bash

export SUB_SERVICE_URL=http://localhost:8081/service/sub
export MUL_SERVICE_URL=http://localhost:8082/service/mul
export DIV_SERVICE_URL=http://localhost:8083/service/div
export SUM_SERVICE_URL=http://localhost:8084/service/sum
sbt run
