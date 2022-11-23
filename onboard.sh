#!/bin/bash

# Shell Scripting.
# This script will read a CSV file that contains 5 new Linux users.
# This script will create each user on the server and add to an existing group called 'Developers'.
# This script will first check for the existence of the user on the system, before it will attempt to create that it.
# The user that is being created also must also have a default home folder
# Each user should have a .ssh folder within its HOME folder. If it does not exist, then it will be created.
# For each user’s SSH configuration, We will create an authorized_keys file and add the below public key.


users=$(cat ./names.csv)

# TO CREATE A USER
for user in $users
 do
if [ -e "/etc/passwd/$user" ]
 then
        echo "The user $user exist"
 else
        sudo useradd "$user"
        echo "The user $user is created successfully"
        sudo usermod -a -G developers "$user"
        echo "User $user is added to developers group"
fi
done

# TO CREATE HOME DIRECTORY FOR A USER IF IT DOES NOT EXIST
for user in $users
 do
if [ -d "/home/$user" ]
 then
       echo "The directory /home/$user exist"
 else
sudo mkdir -p /home/"$user"
        echo "The home directory of the user $user /home/$user is created successfully"
        sudo usermod -d /home/"$user" "$user"
fi
done

# TO CREATE .SSH FOLDER FOR THE USER AND PASTE THE AUTHORIZED_KEYS FROM THE CURRENT USER IN THE SERVER TO THE NEW USER
for user in $users
 do
if [ -d "/home/$user/.ssh" ]
 then
       echo "The directory /home/$user/.ssh exist"
 else
        sudo mkdir "/home/$user/.ssh"
        echo "The directory /home/$user/.ssh is created successfully"
        sudo touch "/home/$user/.ssh/authorized_keys"
        echo "The file authorized_keys is created successfully"
        sudo chown "$USER":"$USER" /home/"$user"/.ssh
        sudo chown "$USER":"$USER" /home/"$user"/.ssh/authorized_keys
        cat "/home/somex/.ssh/authorized_keys" >> "/home/$user/.ssh/authorized_keys"
        echo "authorized_key file transffered successfully"
fi
done
 
