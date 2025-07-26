FROM node:latest AS base
WORKDIR /app
COPY ./package.json ./package.json
COPY ./package-lock.json ./package-lock.json
RUN npm ci --only=production
COPY . .

FROM gcr.io/distroless/nodejs20
WORKDIR /app
COPY --from=base /app .

CMD [ "server.js" ]