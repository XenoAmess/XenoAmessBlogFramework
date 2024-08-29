FROM node:latest
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y git nodejs
RUN npm install hexo -g
WORKDIR /
RUN git clone https://github.com/XenoAmess/XenoAmessBlogFramework.git
WORKDIR /XenoAmessBlogFramework/
RUN chmod +777 ./init.sh;./init.sh;chmod +777 ./update.bat;./update.bat
RUN npm install
RUN hexo clean; hexo generate
ADD cronfile /etc/cron.d/submit-cron
RUN apt-get install -y cron
RUN chmod 0644 /etc/cron.d/submit-cron
RUN touch /var/log/cron.log
RUN service cron restart
ENTRYPOINT hexo server -p 8080
