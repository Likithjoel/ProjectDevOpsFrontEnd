FROM nginx:1.17.1-alpine
COPY nginx.conf /etc/nginx/nginx.conf
COPY /dist/Angular8ClientCrud /usr/share/nginx/html
EXPOSE 4200
