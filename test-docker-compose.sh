#!/bin/bash

IP=$(docker inspect calc-services_sum_1 | jq -r '.[].NetworkSettings.Networks[].IPAddress')
EX=$(curl -s "http://$IP:3000/service/sum?va=1&vb=2")
echo "Sum 1 + 2 == $EX"

IP=$(docker inspect calc-services_sub_1 | jq -r '.[].NetworkSettings.Networks[].IPAddress')
EX=$(curl -s "http://$IP:5000/service/sub?va=7&vb=2")
echo "Sub 7 - 2 == $EX"

IP=$(docker inspect calc-services_mul_1 | jq -r '.[].NetworkSettings.Networks[].IPAddress')
EX=$(curl -s "http://$IP:8080/service/mul?va=3&vb=2")
echo "Mul 3 * 2 == $EX"

IP=$(docker inspect calc-services_div_1 | jq -r '.[].NetworkSettings.Networks[].IPAddress')
EX=$(curl -s "http://$IP:6000/service/div?va=8&vb=2")
echo "Div 8 / 2 == $EX"

IP=$(docker inspect calc-services_agg_1 | jq -r '.[].NetworkSettings.Networks[].IPAddress')
EX=$(curl -s "http://$IP:8090/service?math=1%201%20%2B")
echo "AGG 1 + 1 == $EX"