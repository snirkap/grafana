# grafana
git clone https://github.com/snirkap/grafana.git
cd grafana 
kind create cluster --name monitoring --image kindest/node:v1.23.6 --config kind.yaml
kubectl create -f ./manifests/setup/
kubectl create -f ./manifests/
