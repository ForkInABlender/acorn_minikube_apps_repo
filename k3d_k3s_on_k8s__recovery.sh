# Dylan Kenneth Eliot & GPT-4-plugins (Alpha Edition)


"""
This is for recovering from broken or corrupted installs, where it runs in one place and the other, and the other place borks.

"""

echo "# Exported Kubernetes Configurations" > all_resources.yaml
echo "---" >> all_resources.yaml
kubectl get deployments --all-namespaces -o yaml >> all_resources.yaml
echo "---" >> all_resources.yaml
kubectl get services --all-namespaces -o yaml >> all_resources.yaml
echo "---" >> all_resources.yaml
kubectl get configmaps --all-namespaces -o yaml >> all_resources.yaml
echo "---" >> all_resources.yaml
kubectl get pv --all-namespaces -o yaml >> all_resources.yaml
echo "---" >> all_resources.yaml
kubectl get pvc --all-namespaces -o yaml >> all_resources.yaml
