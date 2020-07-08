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
                sh label: '', script: 'scp /home/ubuntu/.jenkins/workspace/DeclarativePipeline/webapp/target/webapp.war ubuntu@172.31.37.220:/var/lib/tomcat8/webapps/qaapp.war'
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
         stage('ContinuousDelivery')
        {
            steps
            {
                input message: 'Waiting for Approval from DM!', submitter: 'srinivas'
                sh label: '', script: 'scp /home/ubuntu/.jenkins/workspace/DeclarativePipeline/webapp/target/webapp.war ubuntu@172.31.36.172:/var/lib/tomcat8/webapps/prodapp.war'
            }
        }
    }
}
