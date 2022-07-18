FROM node:16.13-alpine

WORKDIR /app

COPY ./package.json /app/
# NPM Install sebelum copy untuk efisiensi eksekusi
RUN npm install

COPY . .
RUN mkdir -p ./log

RUN chown newuser ./log

USER newuser

EXPOSE 9876

CMD ["node","server.js"]