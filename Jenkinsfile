pipeline {
    agent any

    stages {
        stage('Clone GitHub repo') {
            steps {
                sh 'echo "Cloning github repository"'
                git 'https://github.com/singha53/udacity_capstone.git'
            }    
        }        
        stage('Linting step') {
            steps {
                sh 'echo "Lint Dockerfile..."'
                sh 'docker run --rm -i hadolint/hadolint < Dockerfile'
            }
        }   
        stage( 'Build omics-bioanalytics docker image' ) {
            steps {
                sh 'echo "Building docker image ..."'
                sh 'docker build -t singha53/omics-bioanalytics:v0.1 .'
                sh 'docker image ls'                  
            }
        } 
        stage( 'Push image to DockerHub' ) {
            steps {
                withDockerRegistry([url: "", credentialsId: "docker"]) {
                    sh 'echo "Uploading image to DockerHub ..."'
                    sh 'docker login'
                    sh 'docker push singha53/omics-bioanalytics:v0.1'          
                }
            }
        }                                   
        stage( 'Deploy image to AWS EKS' ) {
            steps {
                withAWS( region:'us-west-2', credentials:'capstone' ) {
                    sh 'echo "Update AWS EKS cluster ..."'          
                    sh 'kubectl set image deployment omics-bioanalytics singha53/omics-bioanalytics:v0.1 --record'
                    sh 'kubectl rollout status deployment omics-bioanalytics'
                    sh 'kubectl apply -f templates/deployment.yml'
                    sh 'kubectl apply -f templates/loadbalancer.yml'
                    sh 'kubectl get svc --all-namespaces'
                    sh 'echo "Deployment successful."'
                    sh 'kubectl describe deployment/web-app'
                }
            }
        }               
    }
}
