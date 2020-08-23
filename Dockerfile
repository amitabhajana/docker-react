FROM node:alpine as builder
WORKDIR '/myapp'
COPY package.json /myapp
COPY package-lock.json /myapp
RUN npm install
COPY . .
RUN npm run build


FROM nginx
COPY --from=builder /myapp/build /usr/share/nginx/html
