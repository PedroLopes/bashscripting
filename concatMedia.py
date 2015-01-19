import sys
import subprocess

ffmpeg -i Hotel.mp3 -i Airborne.mp3 -filter_complex '[0] [1] concat=n=2:a=1:v=0 [out]' -map '[out]' output3.mp3

for arg in argv:
	

subprocess.call(['mplayer', "/Users/pedro/Dropbox/12.senses/sound/QuietInletFood/01Tobiko.mp3"])
