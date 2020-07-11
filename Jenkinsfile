

pipeline
{
    agent any
    stages
    {
        stage('ContinuousDownload-Loans')
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
                        mail bcc: '', body: 'Jenkins is unable to download the code from remote git server', cc: '', from: '', replyTo: '', subject: 'Download failed', to: 'git.team@gmail.com'
                        exit(1)
                    }
                }
               
            }
        }
        stage('ContinuousBuild-Loans')
        {
            steps
            {
                script
                {
                    try
                    {
                          sh label: '', script: 'mvn package'
                    }
                    catch(Exception e2)
                    {
                        mail bcc: '', body: 'Jenkins is unable to create an artifact from the code', cc: '', from: '', replyTo: '', subject: 'Build failed', to: 'developement.team@gmail.com'
                        exit(1)
                    }
                }
            
            }
                
        }
	}
}
