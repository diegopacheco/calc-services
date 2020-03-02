#!/bin/bash

echo "Sum 1 + 2 == $(curl -s 'http://172.18.0.5:3000/service/sum?va=1&vb=2') "
echo "Sub 7 - 2 == $(curl -s 'http://172.18.0.3:5000/service/sub?va=7&vb=2') "