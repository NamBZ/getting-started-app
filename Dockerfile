
FROM node:22-bookworm

WORKDIR /app

ENV NODE_ENV=production
ENV SQLITE_DB_LOCATION=/tmp/ecs-todo/todo.db

COPY package.json package-lock.json ./

RUN npm ci --omit=dev \
    && npm cache clean --force

COPY src ./src

EXPOSE 3000

USER node

CMD ["node", "src/index.js"]
