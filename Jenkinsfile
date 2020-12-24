node('master')
{
    stage('ContinuousDownload')
    {
        git 'https://github.com/intelliqittrainings/maven.git'   
    }
    stage('ContinuousBuild')
    {
        sh 'mvn package'   
    }
    stage('ContinuousDeployment')
    {
        sh 'scp /home/ubuntu/.jenkins/workspace/ScriptedPipeline/webapp/target/webapp.war ubuntu@172.31.54.48:/var/lib/tomcat9/webapps/testapp.war'
    }
    stage('ContinuousTesting')
    {
        git 'https://github.com/intelliqittrainings/FunctionalTesting.git'
        sh 'java -jar /home/ubuntu/.jenkins/workspace/ScriptedPipeline/testing.jar'
    }
    stage('ContinuousDelivery')
    {
        input message: 'Waiting for Approval form the DM!', submitter: 'srinivas'
        sh 'scp /home/ubuntu/.jenkins/workspace/ScriptedPipeline/webapp/target/webapp.war ubuntu@172.31.49.130:/var/lib/tomcat9/webapps/prodapp.war'
    }
    
    
    
    
    
    
}
