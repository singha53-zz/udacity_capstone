# Udacity Cloud DevOps Nanodegree Capstone project

> This capstone project deploys my [Omics BioAnalytics RShiny application](https://github.com/singha53/omicsBioAnalytics) on Amazon EKS using CloudFormation. A CI/CD pipeline was developed using Jenkins with a rolling deployment. The Jenkinsfile consists of the following steps (linting, docker build and push to DockerHub and deploying the image to a kubernetes cluster with rollout updates.

## Table of contents

* [Quick start](#quick-start)
* [CI/CD](#cicd)
* [Bugs and feature requests](#bugs-and-feature-requests)
* [Contributing](#contributing)
* [References](#ref)
* [Copyright and license](#copyright-and-license)

## Quick start options

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

> navigate to http://locahost:80 to see running application

### Run on Amazon EKS

1) [Build, tag and push image to DockerHub](https://github.com/singha53/udacity_capstone/blob/master/docs/docker_image_walkthrough.gif)
2) [Create EKS cluster and deploy application](https://github.com/singha53/udacity_capstone/blob/master/docs/eks_walkthrough.gif)
