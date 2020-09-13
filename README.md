# Udacity Cloud DevOps Nanodegree Capstone project

> This capstone project deploys my [Omics BioAnalytics RShiny application](https://github.com/singha53/omicsBioAnalytics) on Amazon EKS using CloudFormation. A CI/CD pipeline was developed using Jenkins with a rolling deployment. The Jenkinsfile consists of the following steps (linting, docker build and push to DockerHub and deploying the image to a kubernetes cluster with rollout updates.

## Table of contents

- [Udacity Cloud DevOps Nanodegree Capstone project](#udacity-cloud-devops-nanodegree-capstone-project)
  - [Table of contents](#table-of-contents)
  - [Quick start](#quick-start)
    - [Run on local machine](#run-on-local-machine)
    - [Run on Amazon EKS](#run-on-amazon-eks)
  - [Continuous Integration Continuous Delivery](#continuous-integration-continuous-delivery)
  - [Copyright and license](#copyright-and-license)

## Quick start

### Run on local machine
1) clone repo
2) [Install docker](https://docs.docker.com/get-docker/)
3) [Make docker account](https://hub.docker.com/signup)
4) build docker image
5) run docker image

```bash
$ git clone https://github.com/singha53/udacity_capstone.git
$ cd udacity_capstone
$ docker login
$ docker build -t omics-bioanalytics .
$ docker run -p 80:80 -t omics-bioanalytics
```

> navigate to http://localhost:80 to see running application

### Run on Amazon EKS

1) [Build, tag and push image to DockerHub](https://github.com/singha53/udacity_capstone/blob/master/docs/dockerhub.md)
2) [EKS cluster and app deployment](https://github.com/singha53/udacity_capstone/blob/master/docs/eks_create.md)

## Continuous Integration Continuous Delivery

1) [Jenkins setup on Amazon EC2](https://github.com/singha53/udacity_capstone/blob/master/docs/jenkins.md)
2) [Running pipeline](https://github.com/singha53/udacity_capstone/blob/master/docs/pipeline.md)

## Copyright and license

Copyright 2020 AMRITPAL SINGH Inc.

Code released under the [MIT license](https://github.com/singha53/udacity_capstone/blob/master/LICENSE).