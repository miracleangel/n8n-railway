FROM node:18-alpine

ARG N8N_VERSION=1.91.3

RUN apk add --update graphicsmagick tzdata

USER root

RUN apk --update add --virtual build-dependencies python3 build-base && \
    npm_config_user=root npm install --location=global n8n@${N8N_VERSION} && \
    apk del build-dependencies

WORKDIR /data

EXPOSE $PORT

ENV N8N_USER_ID=root
ENV N8N_EDITOR_BASE_URL=https://n8n-railway-production-49ad.up.railway.app
ENV WEBHOOK_URL=https://n8n-railway-production-49ad.up.railway.app
ENV N8N_HOST=0.0.0.0

CMD export N8N_PORT=$PORT && n8n start
