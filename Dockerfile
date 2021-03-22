FROM nginx:latest
COPY ./index.html /usr/share/nginx/html/index.html
CMD /usr/sbin/nginx -g "daemon off;"
