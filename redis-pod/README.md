# Redis Pod Demo

```bash
# Create a pod interactively
kubectl run redis-pod --image=redis --port=6379

# Run redis-cli in the pod
kubectl exec -it redis-pod -- redis-cli
# 👋 use it with K9S too

# Get the list of the pods
kubectl get pods

# Get the manifest of the pod
kubectl get pod redis-pod -o yaml > redis-pod.yaml

# Delete the pod
kubectl delete pod redis-pod 

# Recreate the pod from the manifest
kubectl apply -f ./redis-pod.yaml

# Delete the pod from the manifest
kubectl delete -f ./redis-pod.yaml
```