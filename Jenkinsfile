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
      sh 'scp /home/ubuntu/.jenkins/workspace/ScriptedPipeline/webapp/target/webapp.war ubuntu@172.31.82.52:/var/lib/tomcat9/webapps/qaapp.war'
   }
   stage('ContinuousTesting')
   {
       git 'https://github.com/intelliqittrainings/FunctionalTesting.git'
       sh 'java -jar /home/ubuntu/.jenkins/workspace/ScriptedPipeline/testing.jar'
   }
   stage('ContinuousDelivery')
   {
        input message: 'Waiting for approval from the DM!', submitter: 'srinivas'
      sh 'scp /home/ubuntu/.jenkins/workspace/ScriptedPipeline/webapp/target/webapp.war ubuntu@172.31.92.195:/var/lib/tomcat9/webapps/prodapp.war'
  
       
   }
   
   
   
   
}
