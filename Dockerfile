FROM node:alpine

WORKDIR '/app'
COPY package.json .
RUN yarn install
COPY . .

#puts content into build directory /app/build <--- all the stuff to run the app
RUN yarn run build

FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html

