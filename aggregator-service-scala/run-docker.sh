#!/bin/bash

docker ps

docker run --name=agg-scala \
-e SUB_SERVICE_URL=http://localhost:8081/service/sub \
-e MUL_SERVICE_URL=http://localhost:8082/service/mul \
-e DIV_SERVICE_URL=http://localhost:8083/service/div \
-e SUM_SERVICE_URL=http://localhost:8084/service/sum \
--rm -p 8090:8090 \
diegopacheco/agg-scala:v1 &