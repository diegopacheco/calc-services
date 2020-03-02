#!/bin/bash

EX=$(curl -s "http://localhost:8090/service?math=1%201%20%2B%205%20*%2020%20-%2050%20/")
echo "AGG 1 1 + 5 * 20 - 50 / == $EX"
