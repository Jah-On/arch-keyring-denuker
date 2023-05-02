if [ "$EUID" -eq 0 ]
then
    rm -f -r /etc/pacman.d/gnupg
    pacman-key --init
    pacman-key --populate
elif [ "$(command -v doas)" ]
then
    doas rm -f -r /etc/pacman.d/gnupg
    doas pacman-key --init
    doas pacman-key --populate
elif [ "$(command -v sudo)" ]
then
    sudo rm -f -r /etc/pacman.d/gnupg
    sudo pacman-key --init
    sudo pacman-key --populate
else
    echo "Could not run as root, exiting!"
    exit
echo "Keyring denuked!"
fi
