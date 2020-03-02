#!/bin/bash

kubectl delete service/sumrust
kubectl delete service/subpython
kubectl delete service/muljava
kubectl delete service/divgo
kubectl delete service/aggscala

kubectl delete deployment.apps/sumrust
kubectl delete deployment.apps/subpython
kubectl delete deployment.apps/muljava
kubectl delete deployment.apps/divgo
kubectl delete deployment.apps/aggscala
