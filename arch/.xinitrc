xrdb -merge ~/.Xresources

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

xset m 0/0 0 &

numlockx &

if [ -x /usr/bin/start-pulseaudio-x11 ]; then
    /usr/bin/start-pulseaudio-x11
else
    if [ -x /usr/bin/pulseaudio ]; then
        /usr/bin/pulseaudio --start
    fi
fi

amixer sset Master unmute
amixer sset Master 0%

/usr/bin/dropbox &

exec i3 --shmlog-size=26214400 -V >> ~/i3log 2>&1
