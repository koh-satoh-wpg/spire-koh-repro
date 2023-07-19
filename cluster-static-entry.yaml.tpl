kind: Namespace
apiVersion: v1
metadata:
  name: test
---
apiVersion: spire.spiffe.io/v1alpha1
kind: ClusterStaticEntry
metadata:
  namespace: test
  name: test
spec:
  spiffeID: spiffe://A.com/client-test
  parentID: spiffe://A.com/spire/agent/join_token/${JOIN_TOKEN}
  selectors: ["k8s:pod-label:app:client-test"]
