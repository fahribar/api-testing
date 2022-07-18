FROM node:16.13-alpine AS Build

WORKDIR /app

COPY ./package.json /app/
# NPM Install sebelum copy untuk efisiensi eksekusi
RUN npm install

COPY . .

FROM node:16.13-alpine

RUN addgroup -g 101 -S nodejs

RUN adduser -S newuser -u 101 -G nodejs

WORKDIR /app

USER newuser

RUN mkdir -p ./log

RUN chown newuser ./log

COPY --from=build --chown=newuser:nodejs . .

RUN chown -R newuser:nodejs /app

WORKDIR /app

EXPOSE 9876

CMD ["node","server.js"]