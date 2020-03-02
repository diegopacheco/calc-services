#!/bin/bash

kubectl exec -it $(kubectl get pod -l app=aggscala -o jsonpath='{.items[0].metadata.name}') sh
