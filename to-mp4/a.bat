@echo off
cls

call ffmpeg -y -i %1 -c:v h264_nvenc -crf 18 -pix_fmt yuv420p %1.mp4