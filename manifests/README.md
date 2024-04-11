

```bash
# Run K9S in a terminal

# Type the following commands in another terminal
# Create a namespace
kubectl create namespace demo --dry-run=client -o yaml | kubectl apply -f -

# Deploy 3 services from the same image
kubectl apply -f ./deploy.demo-tiny-one.yaml -n demo
kubectl apply -f ./deploy.demo-tiny-two.yaml -n demo
kubectl apply -f ./deploy.demo-tiny-three.yaml -n demo

kubectl describe ingress demo-tiny-one -n demo
kubectl describe ingress demo-tiny-two -n demo
kubectl describe ingress demo-tiny-three -n demo

# Change the number of replicas for demo-tiny-one and apply again
# Then refresh the page (several times)

# Change the environment variable (MESSAGE) for demo-tiny-two and apply again
# Then refresh the page

kubectl delete -f ./deploy.demo-tiny-one.yaml -n demo
kubectl delete -f ./deploy.demo-tiny-two.yaml -n demo
kubectl delete -f ./deploy.demo-tiny-three.yaml -n demo
```

