# -----------------------------------
# Build Stage
# -----------------------------------
FROM node:20 AS build-stage

WORKDIR /usr/src/app

# Copy only package.json & package-lock.json first for caching dependencies
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy the rest of the app except sensitive files (controlled by .dockerignore)
COPY . .

# Pass API key as a build argument
ARG VITE_WEATHER_API_KEY
# Set it as an environment variable so Vite can pick it up
ENV VITE_WEATHER_API_KEY=$VITE_WEATHER_API_KEY

# Build the frontend
RUN npm run build

# -----------------------------------
# Production Stage
# -----------------------------------
FROM nginx:1.25-alpine

# Copy build output from build stage
COPY --from=build-stage /usr/src/app/dist /usr/share/nginx/html

# Optional: add a non-root user
RUN adduser -S -G nginx appuser

# Copy custom nginx config
COPY nginx.conf /etc/nginx/nginx.conf

USER appuser
EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
