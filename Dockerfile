FROM octohost/ruby-1.9
RUN apt-get update && apt-get install -y libsasl2-dev
ADD . /srv/www
RUN cd /srv/www; bundle install --deployment --without test development
# LINK_SERVICE memcached
EXPOSE 5000
CMD ["/usr/local/bin/foreman","start","-d","/srv/www"]
