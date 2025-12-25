export tag=$(date "+%Y%m%d_%H%M%S")
docker build -t 23.94.174.102:8911/xenoamess/xablog:${tag} . --build-arg CACHEBUST=${tag}
docker push 23.94.174.102:8911/xenoamess/xablog:${tag}
docker tag 23.94.174.102:8911/xenoamess/xablog:${tag} 23.94.174.102:8911/xenoamess/xablog:latest
docker push 23.94.174.102:8911/xenoamess/xablog:latest
