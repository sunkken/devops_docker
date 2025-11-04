# -----------------------------------
# Build Stage
# -----------------------------------
FROM node:20 AS build-stage

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm ci

COPY . .

ARG VITE_WEATHER_API_KEY
ENV VITE_WEATHER_API_KEY=$VITE_WEATHER_API_KEY

RUN npm run build

# -----------------------------------
# Production Stage
# -----------------------------------
FROM nginx:1.25-alpine

# Copy build output
COPY --from=build-stage /usr/src/app/dist /usr/share/nginx/html

# Copy custom nginx.conf to replace the default one
COPY nginx.conf /etc/nginx/nginx.conf

# Nginx runs as the 'nginx' user by default in Alpine variant
# So no need to create a custom appuser or change permissions

EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
