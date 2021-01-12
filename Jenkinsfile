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
        mail bcc: '', body: 'Jenkins is unable to download the development code from the github', cc: '', from: '', replyTo: '', subject: 'Download failed', to: 'git.admin@gmail.com'
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
                       sh 'mvn package'
                   }
                   catch(Exception e2)
                   {
                       mail bcc: '', body: 'Jenkins is unable to create an artifact with maven', cc: '', from: '', replyTo: '', subject: 'Build failed', to: 'developers@gmail.com'
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
                      sh 'scp /home/ubuntu/.jenkins/workspace/DeclarativePipeline/webapp/target/webapp.war ubuntu@172.31.82.52:/var/lib/tomcat9/webapps/myapp.war'
                  }
                  catch(Exception e3)
                  {
                      mail bcc: '', body: 'Jenkins is unable to deploy into tomcat on the QA environment', cc: '', from: '', replyTo: '', subject: 'Deployment failed', to: 'middleware.team@gmail.com'
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
               sh 'java -jar /home/ubuntu/.jenkins/workspace/DeclarativePipeline/testing.jar' 
                    }
                    catch(Exception e4)
                    {
                        mail bcc: '', body: 'Selenium automation testing has failed', cc: '', from: '', replyTo: '', subject: 'Testing failed', to: 'testing.team@gmail.com'
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
                       input message: 'Required approval from the DM!', submitter: 'srinivas'
              sh 'scp /home/ubuntu/.jenkins/workspace/DeclarativePipeline/webapp/target/webapp.war ubuntu@172.31.92.195:/var/lib/tomcat9/webapps/myprodapp.war' 
                    }
                    catch(Exception e5)
                    {
                        mail bcc: '', body: 'Unable to deploy into tomcat on the ProdServers', cc: '', from: '', replyTo: '', subject: 'Delivery failed', to: 'delivery.team@gmail.com'
                    }
                }
            }
        }
       
        
    }
   
    
    
    
    
    
    
}
