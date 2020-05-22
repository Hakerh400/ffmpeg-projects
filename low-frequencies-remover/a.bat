@echo off
cls

call ffmpeg -y -i %1 -c:v copy -af "highpass=f=100" %1.mp4