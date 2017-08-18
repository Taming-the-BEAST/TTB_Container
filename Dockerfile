FROM debian:latest
EXPOSE 80

RUN apt-get update

# Essential build environment
RUN apt-get install -y build-essential git

# Install ruby and bundler
RUN apt-get install -y ruby ruby-dev
RUN gem install bundler

# Install LaTeX
RUN apt-get install -y texlive
RUN apt-get install -y texlive-latex-extra
RUN apt-get install -y biber

# Set up NGINX web server
RUN apt-get install -y nginx
COPY TTB.nginx /etc/nginx/sites-available/TTB
RUN rm /etc/nginx/sites-enabled/default
RUN ln -s /etc/nginx/sites-available/TTB /etc/nginx/sites-enabled

# Configure locale (strange things happen otherwise)
ENV LC_ALL "C.UTF-8"
ENV LANG "C.UTF-8"

# Configure daily building of site
WORKDIR /ttb
COPY build_script.sh /ttb/
RUN apt-get install -y cron
RUN ln -s /ttb/build_script.sh /etc/cron.daily/build_ttb

# Perform initial build and start server at runtime
COPY start_server.sh /ttb/
CMD ["bash", "/ttb/start_server.sh"]
