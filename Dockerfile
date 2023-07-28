
# syntax=docker/dockerfile:1

FROM node:16

ENV NODE_ENV=production

WORKDIR /app

COPY ["package.json", "package-lock.json*", "./"]

RUN npm install --production

COPY . .

# Expose port 3000
EXPOSE 3000

# Add healthcheck to ensure that the application is running properly
HEALTHCHECK CMD curl --fail http://localhost:3000 || exit 1

CMD [ "node", "index.js" ]
