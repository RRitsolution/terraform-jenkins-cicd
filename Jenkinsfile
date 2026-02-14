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
    }

}


