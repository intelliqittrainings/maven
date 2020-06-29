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
   }
