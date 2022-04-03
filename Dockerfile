FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN chown -R node /app/node_modules
RUN npm run build

#CMD ["npm","run","start"]
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html