# FROM nginx:1.24-alpine
# RUN rm -rf /usr/share/nginx/html/* 
# RUN rm -rf /etc/nginx/nginx.conf
# RUN rm -rf /etc/nginx/conf.d/default.conf
# COPY static /usr/share/nginx/html
# COPY nginx.conf /etc/nginx/nginx.conf

FROM nginx:1.24-alpine
RUN rm -rf /usr/share/nginx/html && rm -rf /etc/nginx/nginx.conf && rm -rf /etc/nginx/conf.d/default.conf
COPY static /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf