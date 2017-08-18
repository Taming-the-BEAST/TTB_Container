FROM debian:latest
EXPOSE 80

RUN apt-get update

RUN apt-get install -y build-essential ruby ruby-dev git 
RUN gem install bundler

RUN apt-get install -y texlive
RUN apt-get install -y texlive-latex-extra
RUN apt-get install -y biber
RUN apt-get install -y locales

RUN apt-get install -y nginx
COPY TTB.nginx /etc/nginx/sites-available/TTB
RUN rm /etc/nginx/sites-enabled/default
RUN ln -s /etc/nginx/sites-available/TTB /etc/nginx/sites-enabled
RUN nginx

WORKDIR /ttb
COPY build_script.sh /ttb/
