FROM node:latest

WORKDIR /app

COPY ./package.json /app/
# NPM Install sebelum copy untuk efisiensi eksekusi
RUN npm install

COPY . .

EXPOSE 4312

CMD ["node","server.js"]