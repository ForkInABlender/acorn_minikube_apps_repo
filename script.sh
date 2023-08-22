#Dylan Kenneth Eliot
#
#Configure minikube for custom runtime
minikube start --container-runtime=containerd
#Return if it times out on enabling...
minikube addons enable ingress
#same for acorn.....
acorn install --ingress-class-name nginx
#build & run the app
#
#Make sure that you run  'minikube tunnel' before you build and run in a separate terminal window. This will allow the ingress controller to assign
# a domain name with an ip...
#
acorn build .
acorn run .
acorn apps
kubectl get ingress --all-namespaces
