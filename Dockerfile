FROM n8nio/n8n:1.91.3

USER root

RUN apk add --no-cache graphicsmagick tzdata

WORKDIR /data

EXPOSE $PORT

ENV N8N_USER_ID=root
ENV N8N_EDITOR_BASE_URL=https://n8n-railway-production-49ad.up.railway.app
ENV WEBHOOK_URL=https://n8n-railway-production-49ad.up.railway.app
ENV N8N_HOST=0.0.0.0

CMD export N8N_PORT=$PORT && n8n start
