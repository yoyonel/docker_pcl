#!/bin/sh


# url: http://stackoverflow.com/a/25280523
XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
touch $XAUTH
#xauth nlist :0 | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -


docker run \
    -v $XSOCK:$XSOCK \
    -v $XAUTH:$XAUTH \
    --device=/dev/dri/card0:/dev/dri/card0 \
    -e DISPLAY=$DISPLAY \
    -e XAUTHORITY=$XAUTH \
    "$@" \
    yoyo/pcl
