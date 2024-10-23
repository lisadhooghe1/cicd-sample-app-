# Lab Report: LAB 1/ CONTINUOUS INTEGRATION/DELIVERY WITH JENKINS

## 1.1 Set up the lab environment

```git config --global --list # nakijken config git

# 10.jpg
ssh-keygen -t rsa -b 4096 -C "lisa.dhooghe@student.hogent.be" #key genereren
eval "$(ssh-agent -s)" #start ssh agent
ssh-add ~/.ssh/id_rsa # ssh key toevoegen

#public key git 12.jpg # deze kan je bij SSH toevoegen op account github
ssh -T git@github.com # test connectie

 git clone git@github.com:HoGentTIN/infra-24-25-lisadhooghe1.git # ophalen startercode
 mkdir cicd-sample-app-new # aanmaken nieuwe dir

#13.jpg navigeer naar de juiste dir 
cp cicd-sample-app cicd-sample-app-new
cd
cd cicd-sample-app-new
git init
git add.
git commit -m" tekst die commit beschrijft"

#nieuwe repo 14.jpg
git remote add origin git@github.com:lisadhooghe1/cicd-sample-app.git
git push -u origin main


   

```

## 1.2  Build and verify the sample application

```vagrant up
vagrant ssh
./sample-app.sh # uitvoeren script , het niet nodig om extra rechten toe te kennen, reeds uitvoerbaar
#foto you are calling me blauw
sudo docker ps -a # list all containers
sudo docker stop <containerID>
sudo docker rm <containerID>

```

## 1.3 Download and run the Kenkins docker image

```docker pull jenkins/jenkins:lts
docker run -p 8080:8080 -u root \
  -v jenkins-data:/var/jenkins_home \
  -v $(which docker):/usr/bin/docker \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v "$HOME":/home \
  --name jenkins_server jenkins/jenkins:lts
  touch passwd_container.txt   # password hier in  opgeslagen en gepushed 
  #20.jpg
  ```

## 1.4 Configure Jenkins

## 1.5 Use Jenkins to build your application

## 1.6 Add a job to test the application

## 1.7 Create a build pipeline

## 1.7 Use a Jenkinsfile

## 1.9 Make a change in the application

## Resources

List all sources of useful information that you encountered while completing this assignment: books, manuals, HOWTO's, blog posts, etc.
<https://docs.github.com/en>  = documentatie van github
<https://dev.to/msfaizi/how-to-write-jenkinsfile-a-comprehensive-guide-for-beginners-58d2> = walktrough voor het schrijven van een jenkinsfile
<https://chatgpt.com/g/g-HxPrv1p8v-code-tutor>  = code tutor > schrijft zelf geen code maar kan helpen bij foutcodes of wanneer je ergens een stap niet correct hebt uitgevoerd om de logica achter uw fout weer te geven en te corrigeren
