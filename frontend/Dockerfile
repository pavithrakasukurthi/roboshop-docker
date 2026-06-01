FROM nginx:1.24-alpine
WORDIR /opt/app
RUN rm -rf /usr/share/nginx/html/* 
RUN rm -rf /etc/nginx/nginx.conf
RUN rm -rf /etc.nginx/conf.d/default.conf
COPY static /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf