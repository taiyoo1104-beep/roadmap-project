FROM node:20-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
# 開発サーバーを全てのホストから受け入れる設定で起動
CMD ["npm", "run", "dev", "--", "-H", "0.0.0.0"]