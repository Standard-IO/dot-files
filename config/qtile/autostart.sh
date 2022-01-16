#!/bin/sh

# Para que este archivo funcione es necesrio dar permisos
# para moder ejecutar los comandos, para esto ejecutar
# en la terminal:
# chmod +x .config/qtile/autostart.sh

# configuracion de teclado us  internacional

setxkbmap -layout us -variant intl &

# Para habilitar el uso de la  configuración de pantalla 
# utilizar la interfaz de xrandr  guardar la resolución
# y el  contenido de ese archivo copiarlo en esta dirección.

# iconos de sistema
udiskie -t & # icono de pendrive
nm-applet & # network manager
cbatticon -u 5 & # icono de bateria
volumeicon &  # icono para controlar volumen por medio alsamixer

# Fondo de pantalla
nitrogen --restore &

# Activar el compositor de imagenes
picom --experimental-backend &
ligth-locker &
