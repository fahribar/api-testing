FROM node:16.13-alpine

WORKDIR /app

COPY ./package.json /app/
# NPM Install sebelum copy untuk efisiensi eksekusi
RUN npm install

COPY . .

EXPOSE 9876

CMD ["node","server.js"]