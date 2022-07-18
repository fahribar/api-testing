FROM node:16.13-alpine

WORKDIR /app

RUN addgroup -g 101 -S nodejs

RUN adduser -S newuser -u 101 -G nodejs
COPY ./package.json /app/
# NPM Install sebelum copy untuk efisiensi eksekusi
RUN npm install

COPY . .
RUN mkdir -p ./log

RUN chown newuser ./log

USER newuser

EXPOSE 9876

CMD ["node","server.js"]