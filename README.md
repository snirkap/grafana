# grafana
1. git clone https://github.com/snirkap/grafana.git
2. cd grafana 
3. kind create cluster --name monitoring --image kindest/node:v1.23.6 --config kind.yaml
4. kubectl create -f ./manifests/setup/
5. kubectl create -f ./manifests/
## var:
1. label_values(up{job="kube-state-metrics"}, cluster)
2. label_values(kube_node_info, node)
3. label_values(kube_namespace_status_phase{job="kube-state-metrics", cluster="$cluster"}, namespace)
4. label_values(kube_pod_info{job="kube-state-metrics", cluster="$cluster", namespace="$namespace"}, pod)
5. label_values(kube_pod_container_info{job="kube-state-metrics", cluster="$cluster", namespace="$namespace", pod="$pod"}, container)
