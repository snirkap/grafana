# grafana
in this task i created a cluster with kind and created a monitoring system in the cluster with kube-prometheus community, i also created my custom dashboard to monitor the cluster with chained variables (data source, node, namespace, pod, container)  
## Setup:
1. git clone https://github.com/snirkap/grafana.git
2. cd grafana 
3. kind create cluster --name monitoring --image kindest/node:v1.23.6 --config kind.yaml
4. kubectl create -f ./manifests/setup/
5. kubectl create -f ./manifests/
6. kubectl get pods -n monitoring (wait until all the pods are running)
8. kubectl -n monitoring port-forward svc/grafana 3000 --address='0.0.0.0' &
9. enter to the grafana UI "localhost:3000"
10. the user and the password will be "admin"
11. On the left there is a tab, click on the plus and on the import and copy the mydashboard.json file
12. and the you will entar the dashboard that i made to monitor the k8s cluster by chained variables 

