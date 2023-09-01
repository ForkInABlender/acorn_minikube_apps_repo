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
#check your application is running
#acorn apps
#Doubly check that the ingress controller is doing the right thing during IP & domain name assignment, as well as CLASS assignment for the
# controller..... Checking this during a point of failure may help diagnose the problem of what's mismapping...
#kubectl get ingress --all-namespaces
ngrok http 5000 # sets ngrok to listen to anything mapped on the localhost port 5000
