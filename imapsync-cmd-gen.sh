#!/bin/bash
#title          :imapsync_command_generator.sh
#description    :This script is used to generate imapsync commands for the email migration
#author         :Dan George
#date           :20230121
#version        :1      
#usage          :./imapsync_command_generator.sh
#notes          :       
#bash_version   :5.0.17(1)-release
#============================================================================


if [[ $# == 0 ]] || [[ $1 == "-h" ]] || [[ $1 == "--help" ]]
then
    echo -e "\nThis script is used to generate imapsync commands for the email migration.
    
Usage:

-----------------------------------------------------------
    $ $0 [email_and_password_file]
-----------------------------------------------------------

    $ $0 email_account_password_list.txt
      Enter the Source Server name: 
      Enter the Destination Server name: 
      Please choose were you will be running the imapsync command:

      1. Linux
      2. Windows
      +++++++++++++

First create a text file with each line containing email address, source password and destination password separated by space.
If both source and destination password are the same then provide only one password.

Example:

File name: email_account_password_list.txt
Content of this file should look like this
========================================
email_address1 <space> source_password <space> destination_password
email_address2 <space> source_password <space> destination_password
email_address3 <space> same_password
email_address4 <space> same_password
========================================" 
    exit 1
fi

echo -n "Enter the Source Server name: "
read host1
echo -n "Enter the Destination Server name: "
read host2
echo -e "Please choose were you will be running the imapsync command:\n
1. Linux
2. Windows\n+++++++++++++\n"
read os

if [ $os == 1 ];
then
echo -e "\n++++++++++++++++++++++++++++++++++++++++++++\n"

SAVEIFS=$IFS
IFS=$'\n'
for i in `cat $1` 
do

if [ `echo $i | awk '{print NF}'` == 2 ];
then

email=`echo $i | awk '{print $1}'`
password1=`echo $i | awk '{print $2}'`
password2=$password1
echo "imapsync --skipcrossduplicates --automap --buffersize 8192000 --maxsize 100000000 --regexflag \"s/\\\Flagged//g\" --disarmreadreceipts --useuid --subscribeall --syncinternaldates --nofoldersizes --skipsize --host1 $host1 --user1 $email --password1 '$password1' --timeout1 0 --host2 $host2 --user2 $email --password2 '$password2' --timeout2 0 --noabletosearch --errorsmax 10000 --tmpdir \"/var/tmp\""
echo -e "\n++++++++++++++++++++++++++++++++++++++++++++\n"

elif [ `echo $i | awk '{print NF}'` == 3 ];
then

email=`echo $i | awk '{print $1}'`
password1=`echo $i | awk '{print $2}'`
password2=`echo $i | awk '{print $3}'`
echo "imapsync --skipcrossduplicates --automap --buffersize 8192000 --maxsize 100000000 --regexflag \"s/\\\Flagged//g\" --disarmreadreceipts --useuid --subscribeall --syncinternaldates --nofoldersizes --skipsize --host1 $host1 --user1 $email --password1 '$password1' --timeout1 0 --host2 $host2 --user2 $email --password2 '$password2' --timeout2 0 --noabletosearch --errorsmax 10000 --tmpdir \"/var/tmp\""
echo -e "\n++++++++++++++++++++++++++++++++++++++++++++\n"

fi
done
elif [ $os == 2 ];
then
echo -e "\n++++++++++++++++++++++++++++++++++++++++++++\n"

SAVEIFS=$IFS
IFS=$'\n'
for i in `cat $1` 
do

if [ `echo $i | awk '{print NF}'` == 2 ];
then

email=`echo $i | awk '{print $1}'`
password1=`echo $i | awk '{print $2}'`
password2=$password1
echo -e "Tab name: "
echo "\$psise.CurrentPowerShellTab.DisplayName = \"$email\""
echo -e "\n"
echo "imapsync --skipcrossduplicates --automap --buffersize 8192000 --maxsize 100000000 --regexflag \"s/\\\Flagged//g\" --disarmreadreceipts --useuid --subscribeall --syncinternaldates --nofoldersizes --skipsize --host1 $host1 --user1 $email --password1 '$password1' --timeout1 0 --host2 $host2 --user2 $email --password2 '$password2' --timeout2 0 --noabletosearch --errorsmax 10000 --tmpdir \"C:\\tmp\""
echo -e "\n++++++++++++++++++++++++++++++++++++++++++++\n"

elif [ `echo $i | awk '{print NF}'` == 3 ];
then

email=`echo $i | awk '{print $1}'`
password1=`echo $i | awk '{print $2}'`
password2=`echo $i | awk '{print $3}'`
echo -e "Tab name: "
echo "\$psise.CurrentPowerShellTab.DisplayName = \"$email\""
echo -e "\n"
echo "imapsync --skipcrossduplicates --automap --buffersize 8192000 --maxsize 100000000 --regexflag \"s/\\\Flagged//g\" --disarmreadreceipts --useuid --subscribeall --syncinternaldates --nofoldersizes --skipsize --host1 $host1 --user1 $email --password1 '$password1' --timeout1 0 --host2 $host2 --user2 $email --password2 '$password2' --timeout2 0 --noabletosearch --errorsmax 10000 --tmpdir \"C:\\tmp\""
echo -e "\n++++++++++++++++++++++++++++++++++++++++++++\n"

fi
done
fi

IFS=$SAVEIFS
