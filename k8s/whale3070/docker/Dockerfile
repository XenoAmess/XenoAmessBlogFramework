FROM node:25
RUN apt-get update; \
    apt-get upgrade -y; \
    apt-get install -y tar git cron vim nginx;
ADD docker/cronfile /etc/cron.d/submit-cron
RUN chmod 0644 /etc/cron.d/submit-cron
RUN touch /var/log/cron.log
WORKDIR /
COPY whale3070.github.io /var/www/html
COPY update.sh /update.sh
COPY favicon.png /var/www/html/null
ARG CACHEBUST
RUN echo "$CACHEBUST"
RUN chmod +777 /update.sh;cd /var/www/html;/update.sh
#RUN cd /var/www/html ; git fetch ; git reset --hard origin/master ; git pull origin master ; 0
EXPOSE 80
ENTRYPOINT service cron restart;service nginx restart;sleep infinity
