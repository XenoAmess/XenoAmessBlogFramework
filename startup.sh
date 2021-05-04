hexo generate
screen -S hexo -X quit
screen -dmS hexo hexo server -p 8080
nginx -s quit
nginx
