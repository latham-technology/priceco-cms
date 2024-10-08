FROM node:18-alpine

ARG APP_KEYS
ARG API_TOKEN_SALT
ARG ADMIN_JWT_SECRET
ARG TRANSFER_TOKEN_SALT
ARG JWT_SECRET
ARG NODE_ENV
ARG DATABASE_CLIENT
ARG DATABASE_URL
ARG DATABASE_FILENAME


ENV APP_KEYS=${APP_KEYS}
ENV API_TOKEN_SALT=${API_TOKEN_SALT}
ENV ADMIN_JWT_SECRET=${ADMIN_JWT_SECRET}
ENV TRANSFER_TOKEN_SALT=${TRANSFER_TOKEN_SALT}
ENV JWT_SECRET=${JWT_SECRET}
ENV NODE_ENV=${NODE_ENV}
ENV DATABASE_CLIENT=${DATABASE_CLIENT}
ENV DATABASE_URL=${DATABASE_URL}
ENV DATABASE_FILENAME=${DATABASE_FILENAME}

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

ENV HOST=0.0.0.0
ENV PORT=1338

EXPOSE 1338

CMD ["npm", "start"]