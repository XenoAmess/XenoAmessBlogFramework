export tag=$(date "+%Y%m%d_%H%M%S")
docker build -t 23.94.174.102:8911/xenoamess/whale3070blog:${tag} -f Dockerfile ../ --build-arg CACHEBUST=${tag}
docker tag 23.94.174.102:8911/xenoamess/whale3070blog:${tag} 23.94.174.102:8911/xenoamess/whale3070blog:latest
docker push 23.94.174.102:8911/xenoamess/whale3070blog:${tag}
docker push 23.94.174.102:8911/xenoamess/whale3070blog:latest
