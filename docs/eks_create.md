# Deploy omicsBioAnalytics to Amazon Elastic Kubernetes Service

### 1) [Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)
### 2) [Configure AWS account and create AWS profile](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html)
### 3) [Install eksctl and kubectl](https://docs.aws.amazon.com/eks/latest/userguide/getting-started-eksctl.html)

### 4) Enable SSH access for EC2 instances (gather diagnostic information):
-	 Create keypair in the us-west-2 region (Oregon) (*e.g.* eks.pem) [**Note:** "Ensure that you create the key in the same Region that you create the cluster in."]
-	Change permissions on the keypair file so that it can be viewed: 
```bash
$ chmod 400 eks.pem
```
-	Retrieve public key using and save it (add the files to .gitignore): 
```bash
$ ssh-keygen -y -f eks.pem > eks.pub
```

### 5) [Create Amazon EKS cluster and node group](https://docs.aws.amazon.com/eks/latest/userguide/getting-started.html)

* AWS_PROFILE (*e.g.* udacity)

![GIF](https://github.com/singha53/udacity_capstone/blob/master/docs/eks_create.gif)

```bash
eksctl create cluster \
--name omics-bioanalytics \
--version 1.16 \
--region us-west-2 \
--nodegroup-name omics-bioanalytics-linux-nodes \
--node-type t3.medium \
--nodes 3 \
--nodes-min 1 \
--nodes-max 4 \
--ssh-access \
--ssh-public-key eks.pub \
--managed -p AWS_PROFILE
```

![EKS cluster](https://github.com/singha53/udacity_capstone/blob/master/docs/deployment.png)

### 6) Check if cluster was created: 

```bash
$ aws eks list-clusters --region=us-west-2 --output=json --p AWS_PROFILE
```

### 7) Create the deployment (/www mounted as a volume)

```bash
$ kubectl apply -f templates/deployment.yml
```

### 8) Expose deployment as a service frontend by a loadbalancer

```bash
$ kubectl apply -f templates/loadbalancer.yml
```

### 9) List all services

```bash
$ kubectl get svc --all-namespaces
```

### 10) Navigate to the external IP listed in Step 9
* for this example: a3a890c0387354d06b4c9b6d9f1b23f6-1824020278.us-west-2.elb.amazonaws.com
* Note: the service may take a couple minutes to start working (try the link after 5 minutes)

### 11) Delete EKS cluster
* Delete services with an EXTERNAL-IP value

```bash
$ kubectl delete svc web
```

* Delete cluster (AWS_PROFILE (*e.g.* udacity))

```bash
$ eksctl delete cluster --name omics-bioanalytics -p AWS_PROFILE --region us-west-2
```


## References
1) [Kubernetes deployment](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)
2) [Kubernetes LoadBalancer](https://kubernetes.io/docs/concepts/services-networking/service/)