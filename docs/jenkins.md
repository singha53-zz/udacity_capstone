# Jenkins setup on Amazon EC2

### 1) [Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)

### 2) [Configure AWS account and create AWS profile](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html)

### 3) [Launch EC2 instance]
* a) search for EC2 in Services on the AWS Console (for a given region, *e.g.* us-west-2).
* b) Click on Launch Instance (select Launch Instance).
* c) Choose an Amazon Machine Image (AMI): Select Amazon Linux AMI 2018.03.0 (HVM), SSD Volume Type - ami-0841edc20334f9287.
* d) Choose an Instance Type: Select t3.medium (for larger apps)
* e) Click review and launch.
* f) Make or select and existing key pair.
* g) Launch instance.

### 3) [Connect to EC2 using SSH]
* a) select EC2 instance --> Actions --> Connect
* b) follow instructions to ssh into EC2 instance.

![Amazon EC2](https://github.com/singha53/udacity_capstone/blob/master/docs/ec2_connect.png)
