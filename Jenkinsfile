node('master') 
{
    stage('ContinuousDownload') 
    {
        script
        {
            try
            {
                 git 'https://github.com/intelliqittrainings/maven.git'
            }
            catch(Exception e1)
            {
                 mail bcc: '', body: 'Jenkins is unable to download the code from the git repository', cc: '', from: '', replyTo: '', subject: 'Download Failed', to: 'gitadmin@gmail.com'
                       exit(1)
            }
        }
       
    }
    stage('ContinuousBuild')
    {
        script
        {
            try
            {
                sh 'mvn package'
            }
            catch(Exception e2)
            {
                 mail bcc: '', body: 'Jenkins is unable to create an artifact from the code', cc: '', from: '', replyTo: '', subject: 'Build Failed', to: 'devlopers@gmail.com' 
                      exit(1)
            }
        }
        
    }
    stage('ContinuousDeployment')
    {
        script
        {
            try
            {
                 sh 'scp /home/ubuntu/.jenkins/workspace/ScriptedPipeline/webapp/target/webapp.war ubuntu@172.31.16.229:/var/lib/tomcat9/webapps/testapp.war'
            }
            catch(Exception e3)
            {
                 mail bcc: '', body: 'Jenkins is unable to deploy into tomcat on the QAServers', cc: '', from: '', replyTo: '', subject: 'Deployment Failed', to: 'middleware.team@gmail.com'
                        exit(1)
            }
        }
        
        
    }
    stage('ContinuousTesting')
    {
        script
        {
            try
            {
                 git 'https://github.com/intelliqittrainings/FunctionalTesting.git'
                 sh 'java -jar /home/ubuntu/.jenkins/workspace/ScriptedPipeline/testing.jar'
            }
            catch(Exception e4)
            {
                mail bcc: '', body: 'Functional Testing of the selenium scripts has failed', cc: '', from: '', replyTo: '', subject: 'Testing Failed', to: 'testers.team@gmail.com'
                        exit(1)
            }
        }
      
    }
    stage('ContinuousDelivery')
    {
        script
        {
            try
            {
                input message: 'Waiting for Approval from DM!', submitter: 'srinivas'
         sh 'scp /home/ubuntu/.jenkins/workspace/ScriptedPipeline/webapp/target/webapp.war ubuntu@172.31.29.16:/var/lib/tomcat9/webapps/prodapp.war'
            }
            catch(Exception e5)
            {
                mail bcc: '', body: 'Delivery into the prod servers has failed', cc: '', from: '', replyTo: '', subject: 'Delivery Failed', to: 'delivery.team@gmail.com'
            }
        }
        
    }
    
    
    
    
    
}
