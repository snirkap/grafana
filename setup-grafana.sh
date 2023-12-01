#!/bin/bash

# Stop execution if any command fails
set -e

# Create a Kubernetes cluster using kind
kind create cluster --name monitoring --image kindest/node:v1.23.6 --config grafana/kind.yaml

# Create Kubernetes objects defined in the Grafana manifests
kubectl create -f grafana/manifests/setup/
kubectl create -f grafana/manifests/

# Sleep for 2.5 minutes to allow pods to start up
echo "Waiting for 2:30 minutes to allow pods to start..."
sleep 150

# Port forward Grafana service to be accessible externally
kubectl -n monitoring port-forward svc/grafana 3000 --address='0.0.0.0' &




