# My personal config files 
This is my personal config to work with arch linux only rofi config was taken from a personal repo. Because it's a really cool design.

There are confi files that work with keybinding dependencies.

## Base files to build packages

'base-devel'
'openssl'
'zlib'
'xz'

## windows manager and other related

'xorg' - como backend del windows manager.
'qtile' - Windows manager.
'picom-git' - xorg's compositor develop version.
'lightdm' - Display manager.
'lightdm-gtk-greeter' - Greeter for start session.
'lightdm-locker' - Screen locker. 

### Terminal
'allacrity' - terminal emulator
'oh-my-bash'- needs to buld.

### Multimedia
'playerctl' - Multimedia keys. 
'alsa' - Audio control.
'alsamixer' - middleware.
'pavucontrol' -  application inteface.
'pulseAudio' -  Interface app.

### Others

'NetworkManager' - Network configuration.

'scrot' - ScreentShot.

'nitrogen' - Screen Bacground app.

'yay' - Manager to Aur packages (Arch system).

## nvim dependencies

'nvim'
'xclip' - Copy text out and inside vim's clipboard.
'vim-plug' - needs to be build.
'nodejs'- To languages server
'npm' - nodejs package manager


## Bluethoot control

'bluez'
'bluez-utils'

Note:
Check that the packages are installed.
   bluthood con lsmod | grep btusb
Consequently is needed enable the service to be initialized with the systemclt. 
   sudo systemctl start bluethooth.service
   sudo systemctl enable bluethooth.service

To control the system exists a command line utility, the next code enable the bluethooth with a device.
### Turn on and basic configuration.
>    bluethoothctl
>    power on
>    agent on
>    default-agent "this reconect your devices

### To connect a device this with command line utility (bluethoothctl):

>    scan on " Scan every bluetooth devices around
>    scan off " To deactivate sdevice scan. 
>    devices " Print all devices scaned 

>    trust <Device Mac adress> " you can use tab auto comple
>    pair <Device Mac adress> " Same Mac adress.
>    connect <Mac adress>
 

To avoid Bluethoot restart every time you restar your computer change in the file
   sudo vim /etc/bluetooth/main.conf
and there change the line
   autoenable = true.

# Bluethoot audio
'pulse-audio-bluethooth'

