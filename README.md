# calc-services

calc-services: Constellation of 5 microservices doing polish notation and working together. 

## How to Run in Kubernetes(Minikube)
Terminal 1
```bash
./create-minikube.sh
./k8s-deploy.sh
./k8s-port-forward-scala-agg.sh
```
Terminal 2
```bash
kubectl get all -o wide
./test-k8s-agg.sh
```

## How to Run on Docker-Compose
Terminal 1
```bash
docker-compose up
```
Terminal 2
```bash
./test-docker-compose.sh
```

## Services
```

aggregator-service-scala: Does the Polish notation agreggation using all services and aggregates the final result. <BR>
This microservice is build with Scala 2.13 and Akka Http 2.x 

mul-service-java   : Does Multiplciation using Java 8 and Spring Boot 2
sum-service-rust   : Does Sum using Rust 1.41 and Hyper.
div-service-go     : Does Division using go 1.12 and Gin Gonic.
sub-service-python : Does Subtraction using Python 3 and Flask.
```
