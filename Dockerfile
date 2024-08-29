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
ENTRYPOINT hexo server -p 8080
