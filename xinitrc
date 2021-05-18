xmodmap $HOME/.Xmodmap
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
# dbus-update-activation-environment --systemd DISPLAY
# export SSH_AUTH_SOCK
date >> $HOME/.xinitrc_date
