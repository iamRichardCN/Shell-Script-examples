# AUTOMATING THE USER ONBOARDING PROCESS WITH SHELL SCRIPT (AUXILARY PROJECT 1)

For this project we automated a user onboarding process using Shell Scripts. The shell script that was created  read a CSV file that contains new Linux users, created each user on the server and added them to an existing group called 'Developers'. 

This script  first checked for the existence of the user on the system before it creating them and  user being created also had a default home folder and .ssh folder within its HOME folder (this script is contained in the file called onboard.sh in this repository). 

first we created a folder called 

```mkdir Shell```

Moved into the Shell folder

```cd Shell```

Created the csv file name names.csv, the id_rsa , id_rsa.pub and the onboard.sh

<img width="566" alt="making the files in shell" src="https://user-images.githubusercontent.com/111741533/204088203-e7b8e2fa-63d4-4869-9b61-0196e0a607a0.png">

Open the names.csv file

```vi names.csv``

Inserted some random names into it (this names are the supposed users to be onboarded)

insert public key into the  ```vi id_rsa.pub``` and the private key in the ```vi id_rsa````

<img width="430" alt="vi for the three files" src="https://user-images.githubusercontent.com/111741533/204088692-c1970788-715b-44b1-88fe-c059f72dc23b.png">

Create user group in which new users are to be added:

```sudo groupadd developers```

<img width="440" alt="created developers group" src="https://user-images.githubusercontent.com/111741533/204089045-4f8ce7a6-6153-4b24-a33e-ef93e9dee220.png">



Add an executable permission to the onboarding-users.sh file:

```sudo chmod +x onboarding-users.sh```

<img width="404" alt="run the onboarding" src="https://user-images.githubusercontent.com/111741533/204088996-83be2acd-65a3-4225-ac0d-74f5fd7f77fc.png">

Switch current user to root;

```sudo su```

Execute onboarding-users.sh

```./onboarding-users.sh```

After execution the users are added to the server 



https://user-images.githubusercontent.com/111741533/204089544-21e6d77c-85c0-4cb2-b26e-752e6f512147.mp4



Test operation by connecting to server via ssh with any onboarded user





https://user-images.githubusercontent.com/111741533/204089745-5b842caf-c771-4a71-925d-827644e6b465.mp4



