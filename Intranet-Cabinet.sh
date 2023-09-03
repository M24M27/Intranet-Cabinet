ic() {

install_sshpass() {
    case "$OSTYPE" in
        linux*)
            if command -v apt-get &> /dev/null; then
                sudo apt-get install sshpass -y
            elif command -v dnf &> /dev/null; then
                sudo dnf install sshpass -y
            elif command -v pacman &> /dev/null; then
                sudo pacman -S sshpass
            #... other package managers
            else
                echo "Unknown Linux distribution. Please install sshpass manually."
                exit 1
            fi
            ;;
        darwin*)
            echo "MacOS detected. You can install sshpass via Homebrew"
            if ! command -v brew &> /dev/null; then
                echo "Homebrew not installed. Please install Homebrew and then run this script again."
                exit 1
            fi
            brew install hudochenkov/sshpass/sshpass
            ;;
        msys*)
            echo "Windows detected. Please install sshpass manually."
            exit 1
            ;;
        *)
            echo "Unknown operating system. Please install sshpass manually."
            exit 1
            ;;
    esac
}

# Check if sshpass is installed
if ! command -v sshpass &> /dev/null
then
    install_sshpass
fi

# Check if credentials file exists
CREDENTIALS_FILE="$HOME/.sshpass_credentials"
if [ -f $CREDENTIALS_FILE ]; then
    EMAIL=$(head -n 1 $CREDENTIALS_FILE)
    PASSWORD=$(tail -n 1 $CREDENTIALS_FILE)
else
    read -p "Enter your intranet.alxswe.com email: " EMAIL
    read -s -p "Enter your intranet.alxswe.com password: " PASSWORD
    echo

    # Save credentials to file
    echo $EMAIL > $CREDENTIALS_FILE
    echo $PASSWORD >> $CREDENTIALS_FILE
fi

# Automatically login to SSH
sshpass -p $PASSWORD ssh $EMAIL@e0c262f7a7ac.f7f6b6d7.alx-cod.online

}

# add source $HOME/scripts/intranet_cabinet.sh to .bashrc or .bash_profile
echo "source $HOME/scripts/intranet_cabinet.sh" >> $HOME/.bashrc

