# Build the production grade html, js and css
FROM node:alpine AS builder
WORKDIR '/app/'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


# For the nginx setup
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

