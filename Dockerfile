FROM node:25
RUN apt-get update; \
    apt-get upgrade -y; \
    apt-get install -y tar git cron vim; \
    npm install hexo -g;
ADD cronfile /etc/cron.d/submit-cron
RUN chmod 0644 /etc/cron.d/submit-cron
RUN touch /var/log/cron.log
WORKDIR /
RUN git clone https://github.com/XenoAmess/XenoAmessBlogFramework.git
WORKDIR /XenoAmessBlogFramework/
ARG CACHEBUST
RUN echo "$CACHEBUST"
RUN chmod +777 ./init.sh;./init.sh;chmod +777 ./update.bat;./update.bat; \
    npm install; \
    hexo clean; hexo generate
ENTRYPOINT service cron restart;hexo server -p 8080
