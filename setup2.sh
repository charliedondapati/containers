minikube start
# Create a directory inside the Minikube node for registry storage
echo "Creating /data/registry inside Minikube..."
minikube ssh -- "sudo mkdir -p /data/registry && sudo chown 1000:1000 /data/registry"

# Apply the registry pod and service
echo "Deploying Docker registry to Minikube..."
kubectl apply -f extra/registry.yaml -n kube-system

# Wait a moment and show the status
sleep 2
kubectl get pods,svc -n kube-system | grep registry
kubectl port-forward --namespace kube-system service/registry 5000:5000 &
alias k=kubectl

