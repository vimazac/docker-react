FROM node:alpine as builder
WORKDIR /usr/testapp
COPY package.json .
RUN npm install
#no need to use the volumes since this is not dev environment anymore
COPY . . 
RUN npm run build
FROM nginx
EXPOSE 80 
#this container prob needs to get a port map to port 80 Elastic beanstalk is gonna look for 
#the expose instruction.
COPY --from=builder /usr/testapp/build /usr/share/nginx/html


