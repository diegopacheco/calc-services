#!/bin/bash

kubectl port-forward $(kubectl get pod -l app=aggscala -o jsonpath='{.items[0].metadata.name}') 8090:8090
