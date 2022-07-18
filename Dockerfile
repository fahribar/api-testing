FROM node:16.13-alpine AS build

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

WORKDIR /app/log

#COPY --from=build --chown=newuser:nodejs /app/ ./

RUN chmod 775 /app

RUN chown -R newuser:nodejs /app

USER newuser

WORKDIR /app

RUN ls -al

EXPOSE 9876

CMD ["node","server.js"]