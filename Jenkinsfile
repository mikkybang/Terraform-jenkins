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
       
        stage('terraform init') {
            steps {
                sh 'erraform init ./Terraform-jenkins'
            }
        }
        stage('terraform plan') {
            steps {
                sh 'terraform plan ./Terraform-jenkins'
            }
        }
        stage('terraform apply') {
            steps {
                sh 'terraform apply ./Terraform-jenkins'
            }
        }

        
    }
}
