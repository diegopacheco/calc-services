#!/bin/bash

kubectl apply -f specs/agg-scala/
kubectl apply -f specs/div-go/
kubectl apply -f specs/mul-java/
kubectl apply -f specs/sub-python/
kubectl apply -f specs/sum-rust/
