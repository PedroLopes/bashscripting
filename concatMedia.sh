#works #ffmpeg -i Hotel.mp3 -i Airborne.mp3 -filter_complex '[0] [1] concat=n=2:a=1:v=0 [out]' -map '[out]' output3.mp3
