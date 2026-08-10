docker pull node:26
export tag=$(date "+%Y%m%d_%H%M%S")
HOST_IP=$(ip -4 addr show docker0 2>/dev/null | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
HOST_IP=${HOST_IP:-host.docker.internal}
export PROXY="http://${HOST_IP}:10808"
docker build \
  --build-arg HTTP_PROXY=$PROXY \
  --build-arg HTTPS_PROXY=$PROXY \
  --build-arg http_proxy=$PROXY \
  --build-arg https_proxy=$PROXY \
  --build-arg ALL_PROXY=$PROXY \
  --build-arg CACHEBUST=${tag} \
  -t xenoamess/whale3070blog:${tag} -f Dockerfile ../
docker tag xenoamess/whale3070blog:${tag} xenoamess/whale3070blog:latest
docker push xenoamess/whale3070blog:${tag}
docker push xenoamess/whale3070blog:latest
