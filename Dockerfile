FROM node:8.4.0
WORKDIR /app
RUN curl -SLO http://nginx.org/download/nginx-1.13.4.tar.gz \
    && tar zxvf nginx-1.13.4.tar.gz -C /app \
    && /app/nginx-1.13.4/configure --prefix=/usr/local/nginx --with-http_stub_status_module --with-http_ssl_module \
    && /app/nginx-1.13.4/make install
RUN ln -sf /usr/local/nginx/sbin/nginx /usr/local/bin/nginx \
    && rm -rf /app
EXPOSE 80
CMD ["nginx"]