FROM node:20-alpine

RUN apk add --no-cache graphicsmagick tzdata tini

RUN npm install -g n8n

USER node

ENV N8N_USER_FOLDER=/home/node/.n8n
RUN mkdir -p /home/node/.n8n

ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=8080
ENV WEBHOOK_URL=https://n8n-railway-production-49ad.up.railway.app
ENV N8N_EDITOR_BASE_URL=https://n8n-railway-production-49ad.up.railway.app

EXPOSE 8080

ENTRYPOINT ["/sbin/tini","--"]
CMD ["n8n","start"]
