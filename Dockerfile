# phase 1
FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# phase 2
FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html
