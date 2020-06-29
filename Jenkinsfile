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
         sh label: '', script: 'scp /home/ubuntu/.jenkins/workspace/ScriptedPipeline/webapp/target/webapp.war ubuntu@172.31.17.1:/var/lib/tomcat8/webapps/testapp.war'
     }
    
}
