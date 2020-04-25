node('master')
{
   stage('ContinuousDownload-Master') 
   {
       git 'https://github.com/intelliqittrainings/maven.git'
   }
   stage('ContinuousBuild-Master') 
   {
       sh label: '', script: 'mvn package'
   }
  }
