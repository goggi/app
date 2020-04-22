# First step: Build with Node.js
FROM node:lts-alpine AS Builder
WORKDIR /app
COPY package.json yarn.lock /app/
RUN yarn install
COPY . /app
RUN yarn build

# Deliver the dist folder with Nginx
FROM nginx:stable-alpine

COPY nginx.conf.template /etc/nginx/conf.d/default.conf.template
COPY --from=Builder /app/dist /usr/share/nginx/html
COPY docker-entrypoint.sh /

EXPOSE 80
ENTRYPOINT ["sh", "/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]