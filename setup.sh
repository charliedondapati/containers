minikube start
minikube addons enable registry
kubectl port-forward --namespace kube-system service/registry 5000:80 &


