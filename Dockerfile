FROM node:8.4.0
ENV NGINX_HOME /usr/local/nginx
ENV NGINX_VERSION 1.13.4
WORKDIR /app
RUN curl -SLO http://nginx.org/download/nginx-$NGINX_VERSION.tar.gz \
    && tar -xzf nginx-$NGINX_VERSION.tar.gz -C . --strip-components=1 \
    && ./configure --prefix=$NGINX_HOME --with-http_stub_status_module --with-http_ssl_module \
    && make install \
    && rm -rf /app \
    && ln -sf $NGINX_HOME/sbin/nginx /usr/local/bin/nginx
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]