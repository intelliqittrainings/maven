node('master')
{
   stage('ContinuousDownload-Loans') 
   {
       git 'https://github.com/intelliqittrainings/maven.git'
   }
   stage('ContinuousBuild-Loans') 
   {
       sh label: '', script: 'mvn package'
   }
    stage('ContinuousDeployment-Loans') 
   {
       sh label: '', script: '''
scp /home/ubuntu/.jenkins/workspace/ScriptedPipeline/webapp/target/webapp.war ubuntu@172.31.6.65:/var/lib/tomcat8/webapps/testapp.war'''
   }
   stage('ContinuousTesting-Loans')
   {
       git 'https://github.com/intelliqittrainings/FunctionalTesting.git'
   
       sh label: '', script: 'java -jar /home/ubuntu/.jenkins/workspace/ScriptedPipeline/testing.jar'
   }
   }
