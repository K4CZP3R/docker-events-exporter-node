FROM node:16-alpine

WORKDIR /usr/src/app

COPY package*.json ./
COPY prisma/ ./prisma/

RUN npm install

# Bundle app source
COPY . .

RUN npm run build

ENV ENVIRONMENT=production
CMD [ "node", "dist/index.js" ]