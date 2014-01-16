FROM cyberswat/docker-ubuntu

MAINTAINER Kevin Bridges <kevin@cyberswat.com>

RUN apt-get install -y python-software-properties
RUN add-apt-repository -y ppa:nginx/stable
RUN apt-get update
RUN apt-get install -y nginx

# debug tools
RUN apt-get install -y vim

ADD nginx.conf /etc/nginx/
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

WORKDIR /etc/nginx
EXPOSE 80

ENTRYPOINT ["service", "nginx", "start"]
