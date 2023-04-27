FROM node:16-alpine as builder

WORKDIR /usr/reactweb

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

FROM nginx

COPY --from=builder /usr/reactweb/build /usr/share/nginx/html