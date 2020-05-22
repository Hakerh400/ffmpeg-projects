@echo off
cls

call ffmpeg -y -rtbufsize 150M -f gdigrab -framerate 30 -offset_x 0 -offset_y 0 -video_size 1920x1080 -draw_mouse 1 -i desktop -c:v h264_nvenc -r 30 -preset llhp -b:v 3000k -pix_fmt yuv420p "D:/sc.mp4"