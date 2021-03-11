node('master') 
{
<<<<<<< HEAD
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
     sh 'scp /home/ubuntu/.jenkins/workspace/ScriptedPipeline/webapp/target/webapp.war ubuntu@172.31.3.108:/var/lib/tomcat9/webapps/qaapp.war'   
    }
    stage('ContinuousTesting')
    {
       git 'https://github.com/intelliqittrainings/FunctionalTesting.git' 
       sh 'java -jar /home/ubuntu/.jenkins/workspace/ScriptedPipeline/testing.jar'
    }
    stage('ContinuousDelivery')
    {
        sh 'scp /home/ubuntu/.jenkins/workspace/ScriptedPipeline/webapp/target/webapp.war ubuntu@172.31.2.173:/var/lib/tomcat9/webapps/prodapp.war'   
    }
    
    
    
    
    
    
    
    
    
=======
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
      sh 'scp /home/ubuntu/.jenkins/workspace/ScriptedPipeline/webapp/target/webapp.war ubuntu@172.31.94.21:/var/lib/tomcat9/webapps/qaapp.war'
   }
   stage('ContinuousTesting')
   {
       git 'https://github.com/intelliqittrainings/FunctionalTesting.git'
       sh 'java -jar /home/ubuntu/.jenkins/workspace/ScriptedPipeline/testing.jar'
   }
   stage('ContinuousDelivery')
   {
      sh 'scp /home/ubuntu/.jenkins/workspace/ScriptedPipeline/webapp/target/webapp.war ubuntu@172.31.95.160:/var/lib/tomcat9/webapps/prodapp.war'
  
       
   }
   
   
   
   
>>>>>>> 54c150d415fa85a4f0da803abc68aee88f57d19b
}

