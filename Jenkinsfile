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
    }

}


