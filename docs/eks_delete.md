# Delete EKS cluster

### 1) List all services running on cluster

```bash
$ kubectl get svc --all-namespaces
```

### 2) Delete services with an EXTERNAL-IP value

```bash
$ kubectl delete svc web
```

### 3) Delete cluster
* AWS_PROFILE (*e.g.* udacity)

```bash
$ eksctl delete cluster --name omics-bioanalytics -p AWS_PROFILE --region us-west-2
```