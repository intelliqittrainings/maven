pipeline
{
    agent any
    stages
    {
        stage('ContinuousDownload')
        {
            steps
            {
                script
                {
                    try
                    {
                         git 'https://github.com/intelliqittrainings/maven.git'
                    }
                    catch(Exception e1)
                    {
                        
                        mail bcc: '', body: 'Jenkins is unable to download from the remote github', cc: '', from: '', replyTo: '', subject: 'Download Failed', to: 'git.admin@gmail.com'
                        exit(1)
                    }
                }
               
            }
        }
        stage('ContinuousBuild')
        {
            steps
            {
                script
                {
                    try
                    {
                         sh 'mvn package'
                    }
                    catch(Exception e2)
                    {
                        mail bcc: '', body: 'Jenkins is unable to create an artifact from the downloaded code', cc: '', from: '', replyTo: '', subject: 'Build Failed', to: 'dev.team@gmail.com'
                        exit(1)
                    }
                }
               
            }
        }
        stage('ContinuousDeployment')
        {
            steps
            {
                script
                {
                    try
                    {
                       deploy adapters: [tomcat9(credentialsId: 'fe952420-a9b2-41ec-a39c-f8949fe660bb', path: '', url: 'http://172.31.59.157:8080')], contextPath: 'test1', war: '**/*.war' 
                    }
                    catch(Exception e3)
                    {
                        mail bcc: '', body: 'Jenkins is unable to deploy to tomcat on qaservers', cc: '', from: '', replyTo: '', subject: 'Deployment Failed', to: 'middleware.team@gmail.com'
                        exit(1)
                    }
                }
                
            }
        }
        stage('ContinuousTesting')
        {
            steps
            {
                script
                {
                    try
                    {
                        git 'https://github.com/intelliqittrainings/FunctionalTesting.git'
                sh 'java -jar /home/ubuntu/.jenkins/workspace/NewDeclarativePipeline/testing.jar'
                    }
                    catch(Exception e4)
                    {
                        mail bcc: '', body: 'Selenium test scripts are giving a failure status', cc: '', from: '', replyTo: '', subject: 'Testing Failed', to: 'qa.team@gmail.com'
                        exit(1)
                    }
                }
                
            }
        }
        stage('ContinuousDelivery')
        {
            steps
            {
                script
                {
                    try
                    {
                        input message: 'Approval Required!', submitter: 'rahul'
            deploy adapters: [tomcat9(credentialsId: 'fe952420-a9b2-41ec-a39c-f8949fe660bb', path: '', url: 'http://172.31.54.121:8080')], contextPath: 'prod1', war: '**/*.war'
                    }
                    catch(Exception e5)
                    {
                        mail bcc: '', body: 'Jenkins is unable to deploy into tomcat on prodservers', cc: '', from: '', replyTo: '', subject: 'Delivery Failed', to: 'delivery.team@gmail.com'
                    }
                }
            
           }
        }
        
        
        
        
        
        
        
        
        
    }
}
