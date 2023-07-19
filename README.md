### Pre-requsite

Minikube is installed.

### How to repro

1. Get two spire-servers running, and get cluster-static-entry.yaml ready.
    ```sh
    ./test.sh
    ```
1. In a separate terminal, watch for server2/spire-server log. Observe that's stable at this moment.
    ```sh
    kubectl -n server2 logs -f spire-server-0 -c spire-server
    ```
1. (Leave the log termnal and go back to the main terminal,) apply cluster-static-entry.yaml, a registration entry under server1.com trust domain.
    ```sh
    kubectl apply -f cluster-static-entry.yaml
    ```
1. Go back to the log terminal and observe the error log is running.
