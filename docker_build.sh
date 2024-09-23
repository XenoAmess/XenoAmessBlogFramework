export tag=$(date "+%Y%m%d_%H%M%S")
docker build -t registry.digitalocean.com/xenoamess/xablog:${tag} . --build-arg CACHEBUST=${tag}
docker push registry.digitalocean.com/xenoamess/xablog:${tag}
docker tag registry.digitalocean.com/xenoamess/xablog:${tag} registry.digitalocean.com/xenoamess/xablog:latest
docker push registry.digitalocean.com/xenoamess/xablog:latest
