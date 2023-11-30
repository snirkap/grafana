# grafana
## Setup:
1. git clone https://github.com/snirkap/grafana.git
2. cd grafana 
3. kind create cluster --name monitoring --image kindest/node:v1.23.6 --config kind.yaml
4. kubectl create -f ./manifests/setup/
5. kubectl create -f ./manifests/
6. kubectl get pods -n monitoring
7. kubectl -n monitoring port-forward svc/grafana 3000

