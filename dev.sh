#bin/bash

xhost +
docker run -it --rm --env="DISPLAY" --net=host rivet
xhost -
