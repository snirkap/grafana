# Grafana Task
In this task, I created a K8s cluster with kind and created a monitoring system hosted on the cluster with [kube-prometheus community](https://github.com/prometheus-operator/kube-prometheus/tree/release-0.11) , I also created my own custom dashboard to monitor the cluster with chained variables (data source, node, namespace, pod, container)
## requirements:
1. kind
2. kubectl
## Setup:
1. git clone https://github.com/snirkap/grafana.git
2. ./grafana/setup-grafana.sh
3. after you entar grafana ui in "localhost:3000" click on the plus and on the import and copy the mydashboard.json file and import the dashboard, then you will enter to the dashboard that i made to monitor the k8s cluster with chained variables
* the user and password for grafana will be "admin"
## My custom Dash board:
![image](https://github.com/snirkap/grafana/assets/120733215/6f1c5894-95ac-4f8d-92ee-ff3b8a12ab29)
![image](https://github.com/snirkap/grafana/assets/120733215/0293a1ea-4209-477c-b6ff-caebc91329f9)
![image](https://github.com/snirkap/grafana/assets/120733215/0c5c3775-ce7b-4f12-949e-2e32b289b830)
![image](https://github.com/snirkap/grafana/assets/120733215/3fe8083c-5c98-4f61-87b0-b3b25d54da5b)
