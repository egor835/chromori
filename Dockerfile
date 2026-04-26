FROM node:20-slim
RUN corepack enable && corepack prepare pnpm@latest --activate

WORKDIR /app
COPY . .

RUN cd frontend && pnpm i && pnpm build
RUN cd backend && pnpm i --no-optional

RUN useradd -m appuser
RUN chown -R appuser:appuser /app
USER appuser

EXPOSE 8000
CMD ["pnpm", "app"]
