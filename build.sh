#!/bin/bash

echo "Building Scala... "
cd aggregator-service-scala/
sbt package
cd ../

echo "Buulding Java... "
cd mul-service-java/
./gradlew clean build
cd ../

echo "Building Python... "
cd sub-service-python/
pip install -r requirements.txt 
cd ../

echo "Building Go... "
cd div-service-go/
./install-deps.sh
go build
cd ../

echo "Building Rust... "
cd sum-service-rust/
cargo build --release
cd ../
