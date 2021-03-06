#! /bin/sh

DFM_PATH=`pwd`

docker build -t dfm .
docker run --privileged=true --cap-add=SYS_ADMIN \
	-e "container=docker" \
	--tmpfs /tmp --tmpfs /run --tmpfs /run/lock \
	-v /sys/fs/cgroup:/sys/fs/cgroup:ro -v $DFM_PATH:/opt/dfm \
	-p 12345:12345 -p 8080:8080 -p 5600:5600 -p 9200:9200 \
	--name dfm -d dfm
