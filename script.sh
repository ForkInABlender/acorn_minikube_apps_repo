#Dylan Kenneth Eliot
#
echo """
This was given to me by an engineer who built the tool "acorn" who also uses k3d, k3s, and acorn.

This targets traefik instead of the standard nginx-ingress controller.

"""

k3d cluster create # do this in a seperate tab from below unless the line returns a normal response
# waiting to run the next command. ..... tmux may also help for this as a temporary fix...

curl -sfL https://get.k3s.io | bash
mkdir ~/.kube -p
sudo cp /etc/rancher/k3s/k3s.yaml ~/.kube/config && sudo chown $USER ~/.kube/config
sudo chmod 600 ~/.kube/config && export KUBECONFIG=~/.kube/config



#acorn apps
#kubectl get ingress --all-namespaces
