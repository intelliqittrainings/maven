pipeline
{
    agent any
    stages
    {
        stage('CD')
        {
            steps
            {
                git 'https://github.com/intelliqittrainings/maven.git'
            }
        }
        stage('B')
        {
            steps
            {
                sh 'mvn package'
            }
        }
    }
}
