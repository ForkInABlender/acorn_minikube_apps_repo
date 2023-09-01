#Dylan Kenneth Eliot
#
echo """
https://chat.openai.com/share/f61405ef-a70c-4e4a-b8c3-e81b0ed1767d

Refer to the above link for debugging purposes. Even for running in docker rootless mode.
This helped with figuring out how to stand it up locally. One way in minikube and one way in kind.

Use with ngrok, selenium webdriver, a install of google-chrome, and credentials needed to login to
 cloudflare. You can practically automate the process. With tmux, it will run in the background.
  The URLs are temporary with ngrok.
"""


echo """
# kind-config.yaml
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
  kubeadmConfigPatches:
  - |
    kind: InitConfiguration
    nodeRegistration:
      kubeletExtraArgs:
        node-labels: "ingress-ready=true"
  extraPortMappings:
  - containerPort: 80
    hostPort: 80
    protocol: TCP
  - containerPort: 443
    hostPort: 443
    protocol: TCP
  - containerPort: 5000
    hostPort: 5000
    protocol: TCP
  - containerPort: 8080
    hostPort: 8080
    protocol: TCP

""" > kind-config.yaml
kind create cluster cluster --config kind-config.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
acorn install --ingress-class-name nginx
acorn build .
acorn run .
acorn apps
kubectl get ingress --all-namespaces
