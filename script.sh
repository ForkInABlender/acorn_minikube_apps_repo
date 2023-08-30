#Dylan Kenneth Eliot
#
minikube start --container-runtime=docker --driver=docker
minikube addons enable ingress
acorn install --ingress-class-name nginx
echo """
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
- role: worker
""" > kind-config.yaml
kind create cluster cluster --config kind-config.yaml
kubectl config use-context minikube
kubectl get pods --all-namespaces -o yaml > pods.yaml
kubectl get namespaces --all-namespaces -o yaml > namespaces.yaml
kubectl get deployments --all-namespaces -o yaml > deployments.yaml
kubectl get secrets --all-namespaces -o yaml > secrets.yaml
kubectl get pods --all-namespaces -o json | jq '.items[].metadata.annotations' > pod_annotations.json
kubectl get services --all-namespaces -o yaml > services.yaml
kubectl get configmaps --all-namespaces -o yaml > configmaps.yaml

kubectl config use-context kind-kind

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.8.1/deploy/static/provider/cloud/deploy.yaml
kubectl apply -f namespaces.yaml
kubectl apply -f services.yaml
kubectl apply -f deployments.yaml
kubectl apply -f pods.yaml
cat pod_annotations.json | jq -r 'to_entries[] | "\(.key) \(.value | to_entries[] | "\(.key)=\(.value)")"' | while read pod annotations; do
    kubectl annotate pods $pod $annotations --overwrite
done
kubectl apply -f configmaps.yaml
acorn install --ingress-class-name nginx
minikube delete
acorn build .
acorn run .
acorn apps
kubectl get ingress --all-namespaces
