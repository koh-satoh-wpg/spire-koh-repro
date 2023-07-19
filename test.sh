#!/bin/bash

set -Eeuo pipefail

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

minikube start

sleep 10

kubectl apply -f cluster-resources.yaml
kubectl apply -f server1.yaml
kubectl apply -f server2.yaml

sleep 5
kubectl wait -n server1 pod -l app=spire-server --for=condition=Ready --timeout=90s
sleep 5

JOIN_TOKEN=$(kubectl -n server1 exec spire-server-0 -c spire-server -- /opt/spire/bin/spire-server token generate | head -n 1 | cut -d' ' -f2)
cat $SCRIPT_DIR/cluster-static-entry.yaml.tpl |\
  sed s/\${JOIN_TOKEN}/$JOIN_TOKEN/ > $SCRIPT_DIR/cluster-static-entry.yaml
