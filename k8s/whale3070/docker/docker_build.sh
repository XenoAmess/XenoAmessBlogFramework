export tag=$(date "+%Y%m%d_%H%M%S")
docker build -t xenoamess/whale3070blog:${tag} -f Dockerfile ../ --build-arg CACHEBUST=${tag}
docker tag xenoamess/whale3070blog:${tag} xenoamess/whale3070blog:latest
docker push xenoamess/whale3070blog:${tag}
docker push xenoamess/whale3070blog:latest
