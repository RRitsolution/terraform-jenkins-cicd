pipeline {

  agent any 
     tools {
           terraform 'terraform'

         
     }

    environment {
                        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
                        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')  
    }

    stages {
             stage ('1st-Terraform download providers') {

               steps {

                 sh '''
                          terraform init
                    
                   '''
               }
             }

      stage ('terraform fmt & validate'){

        steps {
          sh '''
                  terraform fmt
                  terraform validate
          '''
        }
      }

         stage ('Plan to see resources to be launched'){

        steps {
          sh '''
                  terraform plan
          '''
        }
      }

       stage ('Manual Approval for Infra creation'){

        steps {

                input message: "Please check if ok to proceed ? Approve"
          
        }
      }


       stage ('Finally Infracture creation'){

        steps {

                sh '''
                 terraform apply --auto-approve
                '''
        }
      }

       
       stage('Terraform') {
            steps {
                
                
                // CATCH THE IP: Save the Terraform output to a local file
                script {
                    env.SERVER_IP = sh(script: "terraform output -raw vm_ip", returnStdout: true).trim()
                }
            }
        }

 stage('Ansible') {
  steps {
    withCredentials([sshUserPrivateKey(
      credentialsId: 'PRIVATE_KEY',
      keyFileVariable: 'SSH_KEY',
      usernameVariable: 'SSH_USER'
    )]) {
      sh '''
        ansible -i '"$SERVER_IP"', all \
          -u "$SSH_USER" \
          --private-key "$SSH_KEY" \
          -m shell -a "sudo apt update -y"
      '''
    }
  }
}
      
    }

}


