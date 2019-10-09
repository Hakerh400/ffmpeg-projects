@echo off
cls

call ffmpeg -i "C:\wamp\www\projects\video\1.mp4" -vf fps=10,scale=-1:-1:flags=lanczos,palettegen -y 1.png
call ffmpeg -i "C:\wamp\www\projects\video\1.mp4" -i 1.png -filter_complex "fps=10,scale=-1:-1:flags=lanczos[x];[x][1:v]paletteuse" -y "C:\Users\Thomas\Downloads\1.gif"

del 1.png