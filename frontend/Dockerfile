# Stage 1: build Angular static bundle
FROM node:10-alpine AS builder
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci --no-audit --no-fund
COPY . .
RUN npm run build -- --prod

# Stage 2: serve static files with nginx (nginx.conf is mounted from a ConfigMap in Kubernetes)
FROM nginx:1.25-alpine
COPY --from=builder /app/dist/frontend /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
