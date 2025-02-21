export tag=$(date "+%Y%m%d_%H%M%S")
docker build -t registry.digitalocean.com/xenoamess/whale3070blog:${tag} -f Dockerfile ../ --build-arg CACHEBUST=${tag}
docker tag registry.digitalocean.com/xenoamess/whale3070blog:${tag} registry.digitalocean.com/xenoamess/whale3070blog:latest
docker push registry.digitalocean.com/xenoamess/whale3070blog:${tag}
docker push registry.digitalocean.com/xenoamess/whale3070blog:latest
