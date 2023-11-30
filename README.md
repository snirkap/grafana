# Grafan Task
In this task, I created a K8s cluster with kind and created a monitoring system hosted on the cluster with [kube-prometheus community](https://github.com/prometheus-operator/kube-prometheus/tree/release-0.11) , I also created my own custom dashboard to monitor the cluster with chained variables (data source, node, namespace, pod, container)
## Setup:
1. git clone https://github.com/snirkap/grafana.git
2. kind create cluster --name monitoring --image kindest/node:v1.23.6 --config grafana/kind.yaml
3. kubectl create -f  grafana/manifests/setup/
4. kubectl create -f  grafana/manifests/
5. kubectl get pods -n monitoring (wait until all the pods are running)
6. kubectl -n monitoring port-forward svc/grafana 3000 --address='0.0.0.0' &
7. enter to the grafana UI "localhost:3000" (the user and the password will be "admin")
8. On the left there is a tab, click on the plus and on the import and copy the mydashboard.json file and import the dashboard
9. and the you will entar the dashboard that i made to monitor the k8s cluster by chained variables 

