# OpenTelemetry Collector Deployment in Kubernetes

This project demonstrates how to deploy an OpenTelemetry Collector in a Kubernetes cluster to collect host and application metrics. The collector is configured via a ConfigMap and deployed as a DaemonSet, exposing metrics for Prometheus and logging detailed telemetry data.

## Key Features
- **Host Metrics Collection:** Gathers CPU, memory, disk, filesystem, and load metrics from each node.
- **Dual Exporters:** Exposes metrics on an HTTP endpoint (for Prometheus) and logs telemetry data for debugging.
- **Configurable Pipelines:** Uses OTLP receivers and processes data with batch and attribute enrichment processors.
- **DaemonSet Deployment:** Ensures an instance runs on every node for complete coverage.

## Setup Instructions

1. **Create a Kubernetes Namespace:**
   ```bash
   kubectl create namespace monitoring
   kubectl apply -f collector-config.yaml
   kubectl apply -f otel-collector-daemonset.yaml
   ```
2. **How to Run:**
   - Verify Collector Pods
     ```bash
     kubectl get pods -n monitoring -o wide
     ```
   - View Collector Logs
     ```bash
     kubectl logs -n monitoring <collector-pod-name>
     ```
   - Access Prometheus Metrics
     ```bash
     kubectl port-forward -n monitoring <collector-pod-name> 8899:8899
     ```
     ```bash
     curl http://localhost:8899/metrics
     ```
