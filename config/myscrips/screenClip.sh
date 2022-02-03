#! /bin/bash

scrot -s '/tmp/%F_%T_$wx$h.png' -e 'xclip -selection clipboard -target image/png -i $f && rm $f'
#copy and sent to ciipboardfile
#scrot -ws '/tmp/%F_%T_$wx$h.png' -e 'echo "<img src='data:image/png;base64,"(base64 -w0 "$f")"' />" || xclip -selection clipboard -target text/html -i && rm $f'
