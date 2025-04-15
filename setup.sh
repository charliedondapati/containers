minikube start
# Create a directory inside the Minikube node for registry storage
echo "Creating /data/registry inside Minikube..."
minikube ssh -- "sudo mkdir -p /data/registry && sudo chown 1000:1000 /data/registry"

# Apply the registry pod and service
echo "Deploying Docker registry to Minikube..."
kubectl apply -f extra/registry.yaml 

# Wait till pod is ready and forward port
kill -9 $(lsof -t -i:5000)
kubectl wait --for=condition=ready pod/registry --timeout=60s
kubectl port-forward service/registry 5000:5000 &
alias k=kubectl


