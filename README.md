# Intranet-Cabinet


__#Description__

Intranet Cabinet is a repository containing a bash script designed for ALX students who believe in working hard using smart ways. The script automates the SSH login process to your intranet account by automating the installation of sshpass and securely storing your credentials.
Prerequisites
A Linux or macOS operating system. Windows is not supported.
A valid intranet.alxswe.com account.



__#Prerequisites__

A Linux or macOS operating system. Windows is not supported.
A valid intranet.alxswe.com account.



__#Installation**__

1- Clone the repository to your local machine:
git clone https://github.com/yourusername/Intranet-Cabinet.git
2- Navigate to the cloned repository:
cd Intranet-Cabinet
3- Make the script executable:
chmod +x install_sshpass.sh
4- Run the script:
./install_sshpass.sh


__#Usage__

The first time you run the script, it will ask for your intranet.alxswe.com email and password. These credentials will be stored securely in a hidden file in your home directory (~/.sshpass_credentials) for future use.
**#JUST USE IC COMMAND TO RUN THE SCRIPT FROM ANYWHERE IN YOUR SHELL**

Once your credentials are stored, running the script will automatically login to your intranet account via SSH.



__#Security__

Your credentials are stored in plaintext in the ~/.sshpass_credentials file. It is recommended to restrict access to this file by running:
chmod 600 ~/.sshpass_credentials


__#Contribution__

Contributions to improve the script are welcomed. Please create a pull request with your proposed changes.


__Disclaimer__
This script is intended for educational purposes only. Use it at your own risk. The author is not responsible for any misuse or damage caused by this script.
