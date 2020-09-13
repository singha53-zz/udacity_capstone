# Jenkins setup on Amazon EC2

## Table of contents
- [Jenkins setup on Amazon EC2](#jenkins-setup-on-amazon-ec2)
  - [Table of contents](#table-of-contents)
    - [1) Install AWS CLI](#1-install-aws-cli)
    - [2) Configure AWS account and create AWS profile](#2-configure-aws-account-and-create-aws-profile)
    - [3) Launch EC2 instance](#3-launch-ec2-instance)
    - [4) Connect to EC2 using SSH](#4-connect-to-ec2-using-ssh)
    - [5) Add inbound rules to allow traffic to EC2 instance and Jenkins application](#5-add-inbound-rules-to-allow-traffic-to-ec2-instance-and-jenkins-application)
    - [6) Install and Launch Jenkins](#6-install-and-launch-jenkins)
    - [7) Install required programs to run CI/CD pipelines](#7-install-required-programs-to-run-cicd-pipelines)
    - [8) Manage Plugins](#8-manage-plugins)
    - [9) Add credentials](#9-add-credentials)
    - [10) Pipeline configuration](#10-pipeline-configuration)
    - [10) Create CI/CD pipeline](#10-create-cicd-pipeline)

### 1) [Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)

### 2) [Configure AWS account and create AWS profile](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html)

### 3) [Launch EC2 instance](https://docs.aws.amazon.com/quickstarts/latest/vmlaunch/step-1-launch-instance.html)
* a) search for EC2 in Services on the AWS Console (for a given region, *e.g.* us-west-2).
* b) Click on Launch Instance (select Launch Instance).
* c) Choose an Amazon Machine Image (AMI): Select Amazon Linux AMI 2018.03.0 (HVM), SSD Volume Type - ami-0841edc20334f9287.
* d) Choose an Instance Type: Select t3.medium (for larger apps)
  - If you choose t2.micro, you can change it later by stopping the instance: Actions --> Instance settings --> Change instance type. Start the instance again: Actions --> Instance stae --> Start instance.
* e) Click review and launch.
* f) Make or select and existing key pair.
* g) Launch instance.

### 4) [Connect to EC2 using SSH](https://github.com/singha53/udacity_capstone/blob/master/docs/ec2_connect_sshot.png)
* a) select EC2 instance --> Actions --> Connect
* b) follow instructions to ssh into EC2 instance.

![Amazon EC2](https://github.com/singha53/udacity_capstone/blob/master/docs/ec2_connect_sshot.png)

### 5) Add inbound rules to allow traffic to EC2 instance and Jenkins application
1) Go back to EC2 console, for the particular instance select the Security tab (beside the Details tab):
2) click on security group (e.g. sg-****)
3) Click on **Edit inbound rules** button
4) Click on **Add rule** button and select HTTP for type (Port is 80) and for Source choose **My IP** (only you can are allowed)
5) Click on **Add rule** button and select Custom TCP for type, type in 8080 for Port range and for Source choose **My IP** (only you can are allowed)

### 6) [Install and Launch Jenkins](https://d1.awsstatic.com/Projects/P5505030/aws-project_Jenkins-build-server.pdf)

```bash
$ sudo yum update –y
$ sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
$ sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
$ sudo yum install jenkins -y
$ sudo service jenkins start
```
> go to the EC2 console and copy the Public IPv4 DNS and paste in browser and append 8080 (*e.g.* http://ec2-XX-XXX-XXX-XXX.region.compute.amazonaws.com:8080) and you should see the screen below:

![Jenkins startup screen](https://github.com/singha53/udacity_capstone/blob/master/docs/jenkins_startscreen_sshot.png)

> retreive password by:

```bash
$ sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```
* create first admin user or *Skip and continue as admin*
* if you do not create a user; the username for the default admin is **admin**

### 7) Install required programs to run CI/CD pipelines
1) Git: 
```bash
$ sudo yum install git
$ git --version
```
1) install docker
```bash
$ sudo yum install docker
$ docker -v
```
3) [install docker daemon](https://stackoverflow.com/questions/21871479/docker-cant-connect-to-docker-daemon)
```bash
$ sudo groupadd docker
$ sudo usermod -aG docker $(whoami)
$ sudo service docker start
```
4) Install linter (**e.g.** tidy for HTML, hadolint for Dockerfile) - this example is for [hadolint](https://github.com/hadolint/hadolint) and add permission to [docker daemon](https://www.digitalocean.com/community/questions/how-to-fix-docker-got-permission-denied-while-trying-to-connect-to-the-docker-daemon-socket)
```bash
$ docker pull hadolint/hadolint:latest-alpine
$ docker run --rm -i hadolint/hadolint < Dockerfile
$ sudo chmod 666 /var/run/docker.sock
```
5) AWS CLI
```bash
$ curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
$ unzip awscliv2.zip
$ sudo ./aws/install
$ aws --version
```

6) KUBECTL


### 8) Manage Plugins
1) add Blue Ocean plugins (Manage Jenkins --> Manage Plugins --> Available):
   * search for blue ocean and select: 1) Pipeline Implementation for Blue Ocean, 2) Dashboard for Blue Ocean 3) GitHub Pipeline for Blue Ocean 4) Blue Ocean Pipeline Editor, 5) Blue Ocean. Then click on **Install without restart**

> select **Restart Jenkins when installation is complete and no jobs are running**

### 9) Add credentials
> Managge Jenkins --> Manage Credentials --> click on down arrow beside **(global)** then click on **Add credentials**
1) Docker:
* Kind: Username with password
* Scope: Global
* Username: <DOCKERHUB_username>
* Password: <DOCKERHUB_password>
* ID: docker
2) 

### 10) Pipeline configuration
  1) In Blue Ocean, click on the gear icon beside the repository name
  2) Go to the **Build Configuration** tab --> Scan Repository Triggers --> check Periodically if not otherwise run --> Select interval --> Save

### 10) Create CI/CD pipeline
1) Select **Open Blue Ocean**
2) Click on **Create a new Pipeline**
3) Where do you store your code? GitHub | Connect to GitHub (click on create access token here) and enter it in and click **Connect** | Select your github account | search for the repository (*e.g.* udacity_capstone) and then click **Create Pipeline**