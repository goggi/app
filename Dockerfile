FROM node:lts-alpine

# install simple http server for serving static content
RUN npm install -g http-server
RUN apk add yarn

# make the 'app' folder the current working directory
WORKDIR /app

# copy project files and folders to the current working directory (i.e. 'app' folder)
COPY . .

# install project dependencies
RUN yarn

# build app for production with minifications
RUN yarn build

EXPOSE 8080
CMD [ "http-server", "dist" ]