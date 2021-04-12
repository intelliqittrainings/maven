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
        deploy adapters: [tomcat9(credentialsId: '7d1a1f42-858a-4c50-93cb-b2919f4b059f', path: '', url: 'http://172.31.23.20:9090')], contextPath: 'testapp', war: '**/*.war'
    }
    stage('ContinuousTesting')
    {
        git 'https://github.com/intelliqittrainings/FunctionalTesting.git'
        sh 'java -jar /home/ubuntu/.jenkins/workspace/ScriptedPipeline/testing.jar'
    }
    stage('ContinuousDelivery')
    {
        deploy adapters: [tomcat9(credentialsId: '7d1a1f42-858a-4c50-93cb-b2919f4b059f', path: '', url: 'http://172.31.28.60:9090')], contextPath: 'prodapp', war: '**/*.war'
    }
}
