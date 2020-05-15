pipeline
{
    agent any
    stages
    {
        stage('ContinuousDownload')
        {
            steps
            {
                git 'https://github.com/intelliqittrainings/maven.git'
            }
        }
         stage('ContinuousBuild')
        {
            steps
            {
                sh label: '', script: 'mvn package'
            }
        }
        stage('ContinuousDeployment')
        {
            steps
            {
                sh label: '', script: 'scp /home/ubuntu/.jenkins/workspace/DeclarativePipeline/webapp/target/webapp.war ubuntu@172.31.31.15:/var/lib/tomcat8/webapps/testwebapp.war'
            }
        }
        stage('ContinuousTesting')
        {
            steps
            {
                git 'https://github.com/intelliqittrainings/FunctionalTesting.git'
                sh label: '', script: 'java -jar /home/ubuntu/.jenkins/workspace/DeclarativePipeline/testing.jar'
            }
        }
       
    }
    post
    {
        success
        {
            input message: 'Waiting for Approval!', submitter: 'naresh'
               sh label: '', script: 'scp /home/ubuntu/.jenkins/workspace/DeclarativePipeline/webapp/target/webapp.war ubuntu@172.31.26.41:/var/lib/tomcat8/webapps/prodwebapp.war' 
        }
        failure
        {
            mail bcc: '', body: '', cc: '', from: '', replyTo: '', subject: 'Jenkins CI-CD Failed', to: 'gandham.saikrishna@gmail.com'
        }
       
            
    
    }
    
    
    
}
