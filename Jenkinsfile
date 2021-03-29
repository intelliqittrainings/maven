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
       sh 'scp /home/ubuntu/.jenkins/workspace/ScriptedPipeline1/webapp/target/webapp.war ubuntu@172.31.30.86:/var/lib/tomcat9/webapps/testapp.war'
   }
   stage('ContinuousTesting')
   {
       git 'https://github.com/intelliqittrainings/FunctionalTesting.git'
       sh 'java -jar /home/ubuntu/.jenkins/workspace/ScriptedPipeline1/testing.jar'
       
   }
   stage('ContinuousDelivery')
   {
       sh 'scp /home/ubuntu/.jenkins/workspace/ScriptedPipeline1/webapp/target/webapp.war ubuntu@172.31.18.115:/var/lib/tomcat9/webapps/prodapp.war'
      
   }
   
   
   
}
