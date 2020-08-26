# First step: Build with Node.js
FROM node:lts-alpine AS Builder
WORKDIR /app

# Deliver the dist folder with Nginx
FROM nginx:stable-alpine
LABEL maintainer="mail@163.com"

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=Builder /app/dist /usr/share/nginx/html
