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
         sh label: '', script: 'scp  /home/ubuntu/.jenkins/workspace/MultiBranchPipeline_master/webapp/target/webapp.war ubuntu@172.31.37.220:/var/lib/tomcat8/webapps/testapp.war'
     }
    
}
