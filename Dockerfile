FROM node:24.1.0-bookworm

# npm pinned to 11.5.0; corepack activates the pnpm/yarn version each repo pins via "packageManager"
RUN corepack enable && npm install -g npm@11.5.0

WORKDIR /app
COPY . .

RUN npm install

EXPOSE 4321

CMD ["sh", "-lc", "npm run watch & exec npm run astro-dev -- --host 0.0.0.0 --port 4321"]
