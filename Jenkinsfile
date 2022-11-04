def COLOR_MAP = [
    'SUCCESS': 'good',
    'FAILURE': 'danger',
]
pipeline {
    agent any
    stages {
        stage('Git checkout') {
            steps {
                echo 'Cloning'
                git branch: 'main', url: 'https://github.com/dfeludu4/Kinder_Morgan_Infra.git'
                sh 'ls'
            }
        }
         stage('verify terraform version') {
            steps {
                echo 'verifying the terrform version...'
                sh 'terraform --version'
            }
        }
        stage('Terraform init') {
            steps {
                echo 'Initiliazing terraform project...'
                sh 'terraform init'
            }
        }
        stage('Terraform validate') {
            steps {
                echo 'Code syntax checking...'
                sh 'terraform validate'
            }
        }
        stage('Terraform plan') {
            steps {
                echo 'Terraform plan for the dry run...'
                sh 'terraform plan'
            }
        }
        
        stage('Checkov Scan') {
            steps {
                
                sh """
                sudo pip3 install checkov
                checkov -d . --skip-check CKV_AWS_79 --skip-check CKV_AWS_6 --skip-check CKV_AWS_19 --skip-check CKV_AWS_145 --skip-check CKV_AWS_18 --skip-check CKV_AWS_144 --skip-check CKV_AWS_21 --skip-check CKV2_AWS_6
            
                """
            }
        }
        
        stage('Manual Approval') {
            steps {
                input 'Approval required for deployment'
            }
        }
         stage('Terraform apply') {
            steps {
                echo 'Terraform apply...'
                sh 'sudo terraform apply --auto-approve'
            }
        }
    }
     post {
        always {
            echo 'I will always say Hello again!'
            slackSend channel: '#glorious-w-f-devops-alerts', color: COLOR_MAP[currentBuild.currentResult], message: "*${currentBuild.currentResult}:* Job ${env.JOB_NAME} build ${env.BUILD_NUMBER} \n More info at: ${env.BUILD_URL}"
        }
    }
}