#!/bin/bash

cd aggregator-service-scala/
sbt package
cd ../

cd mul-service-java/
./gradlew clean build
cd ../

cd sub-service-python/
pip install -r requirements.txt 
cd ../

cd div-service-go/
go build
cd ../

cd sum-service-rust/
cargo build
cd ../
