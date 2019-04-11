pipeline {
    agent {
        node {
            label 'master'
        }
    }

    stages {

        stage('terraform started') {
            steps {
                sh 'echo "Started...!" '
            }
        }
        stage('git clone') {
            steps {
                sh 'rm -r *; git clone https://github.com/mikkybang/Terraform-jenkins.git'
            }
        }
        stage('tfsvars create'){
            steps {
                sh 'cp /home/ec2-user/vars.tf ./Terraform-jenkins/'
            }
        }
        stage('terraform init') {
            steps {
                sh '/home/ec2-user/terraform init ./Terraform-jenkins'
            }
        }
        stage('terraform plan') {
            steps {
                sh 'ls ./jenkins; /home/ec2-user/terraform plan ./Terraform-jenkins'
            }
        }
        stage('terraform apply') {
            steps {
                sh '/home/ec2-user/terraform apply ./Terraform-jenkins'
            }
        }

        
    }
}
