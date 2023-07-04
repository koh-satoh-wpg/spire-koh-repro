kind: Namespace
apiVersion: v1
metadata:
  name: test
---
apiVersion: spiffeid.spiffe.io/v1beta1
kind: SpiffeID
metadata:
  namespace: test
  name: test
spec:
  parentId: spiffe://A.com/spire/agent/join_token/${JOIN_TOKEN}
  selector:
    namespace: client-test
    podLabel:
      app: client-test
  spiffeId: spiffe://A.com/client-test
