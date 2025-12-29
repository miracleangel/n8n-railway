FROM n8nio/n8n:latest-debian

USER root

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
     graphicsmagick \
     tzdata \
  && rm -rf /var/lib/apt/lists/*

ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=8080
ENV WEBHOOK_URL=https://n8n-railway-production-49ad.up.railway.app
ENV N8N_EDITOR_BASE_URL=https://n8n-railway-production-49ad.up.railway.app

EXPOSE 8080
USER node