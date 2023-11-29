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
## dashboard:
{
  "annotations": {
    "list": [
      {
        "builtIn": 1,
        "datasource": "-- Grafana --",
        "enable": true,
        "hide": true,
        "iconColor": "rgba(0, 211, 255, 1)",
        "name": "Annotations & Alerts",
        "target": {
          "limit": 100,
          "matchAny": false,
          "tags": [],
          "type": "dashboard"
        },
        "type": "dashboard"
      }
    ]
  },
  "editable": true,
  "fiscalYearStartMonth": 0,
  "graphTooltip": 0,
  "id": 28,
  "iteration": 1701276863392,
  "links": [],
  "liveNow": false,
  "panels": [
    {
      "datasource": {
        "type": "prometheus",
        "uid": "${datasource}"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "mappings": [],
          "max": 30,
          "min": 0,
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "string"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 0,
        "y": 0
      },
      "id": 12,
      "options": {
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "showThresholdLabels": false,
        "showThresholdMarkers": true,
        "text": {}
      },
      "pluginVersion": "8.3.3",
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${datasource}"
          },
          "exemplar": true,
          "expr": "count(kube_pod_info{job=\"kube-state-metrics\", node=~\"$node\"}) by (node)\n",
          "interval": "",
          "legendFormat": "",
          "refId": "A"
        }
      ],
      "title": "pods runnig on node",
      "type": "gauge"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "${datasource}"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "mappings": [],
          "max": 100,
          "min": 0,
          "thresholds": {
            "mode": "percentage",
            "steps": [
              {
                "color": "green",
                "value": null
              }
            ]
          },
          "unit": "percent"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 12,
        "y": 0
      },
      "id": 10,
      "options": {
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "showThresholdLabels": false,
        "showThresholdMarkers": true
      },
      "pluginVersion": "8.3.3",
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${datasource}"
          },
          "exemplar": true,
          "expr": "sum(kube_pod_status_phase{phase=\"Running\"}) / sum(kube_pod_status_phase)*100",
          "interval": "",
          "legendFormat": "",
          "refId": "A"
        }
      ],
      "title": "Pod runnig ratio",
      "type": "gauge"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "${datasource}"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisLabel": "",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "drawStyle": "line",
            "fillOpacity": 0,
            "gradientMode": "none",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "lineInterpolation": "smooth",
            "lineWidth": 1,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "auto",
            "spanNulls": false,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "none"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 0,
        "y": 8
      },
      "id": 8,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom"
        },
        "tooltip": {
          "mode": "single"
        }
      },
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${datasource}"
          },
          "exemplar": true,
          "expr": "sum(container_memory_usage_bytes{container!=\"\", container!=\"POD\", container=~\"$container\"}) by (container) / 1024 / 1024 / 1024\n",
          "interval": "",
          "legendFormat": "",
          "refId": "A"
        }
      ],
      "title": "Panel Title",
      "type": "timeseries"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "${datasource}"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "none"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 0,
        "y": 16
      },
      "id": 6,
      "options": {
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "showThresholdLabels": false,
        "showThresholdMarkers": true
      },
      "pluginVersion": "8.3.3",
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${datasource}"
          },
          "exemplar": true,
          "expr": "sum(rate(container_cpu_usage_seconds_total{container!=\"\",container!=\"POD\", container=~\"$container\"}[1m])) by (container)\n\n",
          "interval": "",
          "legendFormat": "",
          "refId": "A"
        }
      ],
      "title": "cpu usage",
      "type": "gauge"
    }
  ],
  "schemaVersion": 34,
  "style": "dark",
  "tags": [],
  "templating": {
    "list": [
      {
        "current": {
          "selected": false,
          "text": "prometheus",
          "value": "prometheus"
        },
        "hide": 0,
        "includeAll": false,
        "label": "data source",
        "multi": false,
        "name": "datasource",
        "options": [],
        "query": "prometheus",
        "queryValue": "",
        "refresh": 1,
        "regex": "",
        "skipUrlSync": false,
        "type": "datasource"
      },
      {
        "current": {
          "isNone": true,
          "selected": false,
          "text": "None",
          "value": ""
        },
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "definition": "label_values(up{job=\"kube-state-metrics\"}, cluster)",
        "hide": 2,
        "includeAll": false,
        "multi": false,
        "name": "cluster",
        "options": [],
        "query": {
          "query": "label_values(up{job=\"kube-state-metrics\"}, cluster)",
          "refId": "StandardVariableQuery"
        },
        "refresh": 2,
        "regex": "",
        "skipUrlSync": false,
        "sort": 1,
        "type": "query"
      },
      {
        "current": {
          "selected": false,
          "text": "monitoring-worker",
          "value": "monitoring-worker"
        },
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "definition": "label_values(kube_node_info, node)",
        "hide": 0,
        "includeAll": false,
        "multi": false,
        "name": "node",
        "options": [],
        "query": {
          "query": "label_values(kube_node_info, node)",
          "refId": "StandardVariableQuery"
        },
        "refresh": 1,
        "regex": "",
        "skipUrlSync": false,
        "sort": 0,
        "type": "query"
      },
      {
        "current": {
          "selected": false,
          "text": "monitoring",
          "value": "monitoring"
        },
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "definition": "label_values(kube_namespace_status_phase{job=\"kube-state-metrics\", cluster=\"$cluster\"}, namespace)",
        "hide": 0,
        "includeAll": false,
        "multi": false,
        "name": "namespace",
        "options": [],
        "query": {
          "query": "label_values(kube_namespace_status_phase{job=\"kube-state-metrics\", cluster=\"$cluster\"}, namespace)",
          "refId": "StandardVariableQuery"
        },
        "refresh": 2,
        "regex": "",
        "skipUrlSync": false,
        "sort": 1,
        "type": "query"
      },
      {
        "current": {
          "selected": false,
          "text": "alertmanager-main-0",
          "value": "alertmanager-main-0"
        },
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "definition": "label_values(kube_pod_info{job=\"kube-state-metrics\", cluster=\"$cluster\", namespace=\"$namespace\"}, pod)",
        "hide": 0,
        "includeAll": false,
        "multi": false,
        "name": "pod",
        "options": [],
        "query": {
          "query": "label_values(kube_pod_info{job=\"kube-state-metrics\", cluster=\"$cluster\", namespace=\"$namespace\"}, pod)",
          "refId": "StandardVariableQuery"
        },
        "refresh": 2,
        "regex": "",
        "skipUrlSync": false,
        "sort": 1,
        "type": "query"
      },
      {
        "current": {
          "selected": false,
          "text": "alertmanager",
          "value": "alertmanager"
        },
        "datasource": {
          "type": "prometheus",
          "uid": "${datasource}"
        },
        "definition": "label_values(kube_pod_container_info{job=\"kube-state-metrics\", cluster=\"$cluster\", namespace=\"$namespace\", pod=\"$pod\"}, container)",
        "hide": 0,
        "includeAll": false,
        "multi": false,
        "name": "container",
        "options": [],
        "query": {
          "query": "label_values(kube_pod_container_info{job=\"kube-state-metrics\", cluster=\"$cluster\", namespace=\"$namespace\", pod=\"$pod\"}, container)",
          "refId": "StandardVariableQuery"
        },
        "refresh": 1,
        "regex": "",
        "skipUrlSync": false,
        "sort": 0,
        "type": "query"
      }
    ]
  },
  "time": {
    "from": "now-5m",
    "to": "now"
  },
  "timepicker": {},
  "timezone": "",
  "title": "my_dash Copy",
  "uid": "y0uv8AHIk",
  "version": 2,
  "weekStart": ""
}
