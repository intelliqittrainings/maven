pipeline
{
    agent any
    stages
    {
        stage('ContinuousDownload-Master')
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
                        mail bcc: '', body: 'Jenkins is unable to download the code from remote git server', cc: '', from: '', replyTo: '', subject: 'Download failed', to: 'git.team@gmail.com'
                        exit(1)
                    }
                }
               
            }
        }
        stage('ContinuousBuild-Master')
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
                        mail bcc: '', body: 'Jenkins is unable to create an artifact from the code', cc: '', from: '', replyTo: '', subject: 'Build failed', to: 'developement.team@gmail.com'
                        exit(1)
                    }
                }
            
            }
                
        }
        stage('ContinuousDeployment-Master')
        {
            steps
            {
                script
                {
                    try
                    {
                        sh label: '', script: 'scp /home/ubuntu/.jenkins/workspace/DeclarativePipeline/webapp/target/webapp.war ubuntu@172.31.37.220:/var/lib/tomcat8/webapps/testwebapp.war'
                    }
                    catch(Exception e3)
                    {
                        mail bcc: '', body: 'Jenkins is unable to deploy into tomcat on QAServers', cc: '', from: '', replyTo: '', subject: 'Deployment failed', to: 'middleware.team@gmail.com'
                        exit(1)
                    }
                }
                
            }
            
        }
        stage('ContinuousTesting-Master')
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
                        mail bcc: '', body: 'Selenium Test scripts have failed', cc: '', from: '', replyTo: '', subject: 'Testing failed', to: 'qa.team@gmail.com'
                        exit(1)
                    }
                }
               
            }
        }
        stage('ContinuousDelivery-Master')
        {
           steps
           {
               script
               {
                   try
                   {
                      
               sh label: '', script: 'scp /home/ubuntu/.jenkins/workspace/DeclarativePipeline/webapp/target/webapp.war ubuntu@172.31.36.172:/var/lib/tomcat8/webapps/prodwebapp.war'
                   }
                   catch(Exception e5)
                   {
                       mail bcc: '', body: 'Delivery into the prod servers has failed', cc: '', from: '', replyTo: '', subject: 'Delivery failed', to: 'delivery.team@gmail.com'
                   }
               }
               
           }
        }
    }
    
}
