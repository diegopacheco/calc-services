#!/bin/bash

export SUB_SERVICE_URL=http://127.0.0.1:8081/service/sub
export MUL_SERVICE_URL=http://127.0.0.1:8082/service/mul
export DIV_SERVICE_URL=http://127.0.0.1:8083/service/div
export SUM_SERVICE_URL=http://127.0.0.1:8084/service/sum
sbt run