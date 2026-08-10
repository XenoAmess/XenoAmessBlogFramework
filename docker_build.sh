docker pull node:26
export tag=$(date "+%Y%m%d_%H%M%S")
docker build -t xenoamess/xablog:${tag} . --build-arg CACHEBUST=${tag}
docker push xenoamess/xablog:${tag}
docker tag xenoamess/xablog:${tag} xenoamess/xablog:latest
docker push xenoamess/xablog:latest
