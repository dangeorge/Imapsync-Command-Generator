# Imapsync-Command-Generator
Script to generate imapsync commands for the email migration

This script is used to generate imapsync commands for the email migration. This script will be helpful in case you have many email accounts that you need to migrate. You can create list of email accounts and password in a file and run this script to generate the imapsync commands rather than manually creating the imapsync commands for each email accounts.
    
## Installation

You can clone this git repository and provide executable permission to the script and run.

    $ git clone https://github.com/dangeorge/Imapsync-Command-Generator.git   
    $ cd Imapsync-Command-Generator   
    $ chmod +x imapsync-cmd-gen.sh   
    $ ./imapsync-cmd-gen.sh

## Usage:

---
    $ ./imapsync-cmd-gen.sh [email_and_password_file]
---

    $ ./imapsync-cmd-gen.sh email_account_password_list.txt
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

email_address1 < space > source_password < space > destination_password   
email_address2 < space > source_password < space > destination_password  
email_address3 < space > same_password  
email_address4 < space > same_password  

For running imapsync commands in windows, you can make use of Powershell ISE were it has option to create multiple tabs and can run email migration of each email account in separate tabs. This script also generates the command to name the tab, so you can know which email migration is in progress after it is started.
