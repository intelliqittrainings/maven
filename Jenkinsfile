node('master') 
{
    stage('ContinuousDownload_Master') 
    {
         git 'https://github.com/intelliqittrainings/maven.git'
    }
     stage('ContinuousBuild_Master') 
    {
        sh label: '', script: 'mvn package'
    }
    stage('ContinuousDeployment_Master')
    {
        sh label: '', script: 'scp /home/ubuntu/.jenkins/workspace/ScriptedPipeline/webapp/target/webapp.war ubuntu@172.31.55.129:/var/lib/tomcat8/webapps/qaapp.war'
    }
    stage('ContinuousTesting_Master')
    {
        git 'https://github.com/intelliqittrainings/FunctionalTesting.git'
        sh label: '', script: 'java -jar /home/ubuntu/.jenkins/workspace/ScriptedPipeline/testing.jar'
    }
     stage('ContinuousDelivery_Master')
    {
        input message: 'Waiting for Approval from the DM!', submitter: 'srinivas'
        sh label: '', script: 'scp /home/ubuntu/.jenkins/workspace/ScriptedPipeline/webapp/target/webapp.war ubuntu@172.31.48.61:/var/lib/tomcat8/webapps/prodapp.war'
    }
    
    
    
    
    
}
