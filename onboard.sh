# Shell Scripting.
# This script will read a CSV file that contains 20 new Linux users.
# This script will create each user on the server and add to an existing group called 'Developers'.
# This script will first check for the existence of the user on the system, before it will attempt to create that it.
# The user that is being created also must also have a default home folder
# Each user should have a .ssh folder within its HOME folder. If it does not exist, then it will be created.
# For each user’s SSH configuration, We will create an authorized_keys file and add the below public key.
#!/bin/bash

userfile=$(cat names.csv)
password=password

#to ensure only users with sudo priveledges can run this script
 if [ $(id -u) -eq 0 ]; then
   
#read the  file to check of the user already exist
    for user in $userfile
    do
       echo $user
    if id "$user" &>/dev/null
    then 
    
      echo 'user exist'
    else

#this conditions will add a new user
      useradd -m -d /home/$user -s /bin/bash - g developers $user
     echo 'new user created'
     echo
     #this will create a ssh folder in the user home folder
     su - -c "mkdir ~/.ssh/" $user
     echo "ssh directory created for new users"
     echo

#the next step is to set the user permission in the ssh directory

    su - -c "chmod 700 ~/.ssh" $user
    echo "user permision changed for .ssh directory"
    echo
#create authorisation key for each user
    su - -c "touch ~/.ssh/authorized_keys" $user
   echo 'authorized key file created'
   echo
#set the permission for the key file
    su - -c "chmod 600 ~/.ssh/authorized_keys" $user
   echo 'user permission for authorized key set'
   echo
#we need to create and set public key
    cp -R "/root/onboard/id_rsa.pub" "/home/$user/.ssh/authorized_keys"
    echo "Copyied the Public Key to New User Account on the server"
        echo
        echo

        echo "USER CREATED"

# Generate a password.
sudo echo -e "$PASSWORD\n$PASSWORD" | sudo passwd "$user" 
sudo passwd -x 5 $user
            fi
        done
    else
    echo "Only Admin Can Onboard A User"
    fi


   


   





     

