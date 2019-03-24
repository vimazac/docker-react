FROM node:alpine as builder
WORKDIR /usr/testapp
COPY package.json .
RUN npm install
#no need to use the volumes since this is not dev environment anymore
COPY . . 
RUN npm run build

FROM nginx
COPY --from=builder /usr/testapp/build /usr/share/nginx/html


