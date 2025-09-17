FROM node:18-slim AS build
WORKDIR /app
COPY package*.json /app
RUN npm install
COPY . .

FROM node:18-slim
WORKDIR /app
COPY --from=build /app .
RUN npm install --production
COPY . .
EXPOSE 3000
CMD [ "npm", "start" ]

