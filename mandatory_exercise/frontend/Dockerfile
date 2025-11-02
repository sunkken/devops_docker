# build
FROM node:16-alpine AS build

WORKDIR /usr/src/app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# production
FROM nginx:1.25-alpine

WORKDIR /usr/src/app
COPY --from=build /usr/src/app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 8080
USER 101
CMD ["nginx", "-g", "daemon off;"]
