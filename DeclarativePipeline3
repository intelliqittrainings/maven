pipeline
{
    agent any
    stages
    {
        stage('ContinuousDownload')
        {
            steps
            {
                script
                {
                   try
                   {
                       git 'https://github.com/intelliqittrainings/maven.git'
                   }
                   catch(Exception e1)
                   {
                       mail bcc: '', body: 'Jenkins is unable to download from remote github', cc: '', from: '', replyTo: '', subject: 'Download failed', to: 'gitadmin@outlook.com'
                       exit(1)
                   }
                }
               
            }
        }
         stage('ContinuousBuild')
        {
            steps
            {
                script
                {
                   try
                   {
                       sh label: '', script: 'mvn package'
                   }
                   catch(Exception e2)
                   {
                       mail bcc: '', body: 'Jenkins is unable to create an artifact from the code', cc: '', from: '', replyTo: '', subject: 'Build failed', to: 'developers@outlook.com'
                      exit(1)
                   }
                }
               
            }
        }
        stage('ContinuousDeployment')
        {
            steps
            {
                script
                {
                   try
                   {
                      sh label: '', script: 'scp /home/ubuntu/.jenkins/workspace/DeclarativePipeline/webapp/target/webapp.war ubuntu@172.31.31.15:/var/lib/tomcat8/webapps/testwebapp.war'
                   }
                   catch(Exception e3)
                   {
                       mail bcc: '', body: 'Jenkins is unable to deploy into tomcat on the QaServers', cc: '', from: '', replyTo: '', subject: 'Deployment failed', to: 'middleware@outlook.com'
                       exit(1)
                   }
                }
                
            }
        }
        stage('ContinuousTesting')
        {
            steps
            {
                script
                {
                                    
                    try
                    {
                        git 'https://github.com/intelliqittrainings/FunctionalTesting.git'
                       sh label: '', script: 'java -jar /home/ubuntu/.jenkins/workspace/DeclarativePipeline/testing.jar'
                    }
                    catch(Exception e4)
                    {
                       mail bcc: '', body: 'Functional testing of the app on QAServers failed', cc: '', from: '', replyTo: '', subject: 'Testing failed', to: 'testers@outlook.com'
                       exit(1)
                    }
                }
                
            }
        }
        stage('ContinuousDelivery')
        {
            steps
            {
                script
                {
                   try
                   { 
                        input message: 'Waiting for Approval!', submitter: 'naresh'
                        sh label: '', script: 'scp /home/ubuntu/.jenkins/workspace/DeclarativePipeline/webapp/target/webapp.war ubuntu@172.31.26.41:/var/lib/tomcat8/webapps/prodwebapp.war' 
                    }
                    catch(Exception e5)
                    {
                         mail bcc: '', body: 'Unable to deploy into ProdServers', cc: '', from: '', replyTo: '', subject: 'Delivery failed', to: 'delevery@outlook.com'
                    }
                }
            }
        }
       
    }
  
       
            
    
 
    
    
    
}
