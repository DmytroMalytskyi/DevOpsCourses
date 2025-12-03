FROM node:20-bookworm-slim
WORKDIR /app
COPY package.json package-lock.json* ./
RUN npm install --only=production
COPY app.js ./
CMD ["node", "app.js"]
