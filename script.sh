minikube start --container-runtime=containerd
sleep .1
minikube addons enable ingress
sleep 3
acorn install --ingress-class-name nginx
acorn build .
acorn run .
acorn apps
kubectl get ingress --all-namespaces
