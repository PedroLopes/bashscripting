# uses https://gist.github.com/dergachev/4627207
ffmpeg -i $1  -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=3 > out.gif
