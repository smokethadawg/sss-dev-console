# ── Stage 1: builder ──────────────────────────────────────────────────────────
FROM node:20-alpine AS builder
WORKDIR /app

# Copy dependency manifests first to leverage layer caching.
# package-lock.json is optional; the trailing * means "copy if present".
COPY package.json package-lock.json* ./

# Use npm ci when a lockfile is present, otherwise fall back to npm install.
RUN if [ -f package-lock.json ]; then npm ci; else npm install; fi

# Copy the rest of the source and build the Next.js app.
COPY . .
RUN npm run build

# ── Stage 2: runner ───────────────────────────────────────────────────────────
FROM node:20-alpine AS runner
WORKDIR /app
ENV NODE_ENV=production

# Only copy the artifacts needed to run the production server.
COPY --from=builder /app/.next          ./.next
COPY --from=builder /app/node_modules   ./node_modules
COPY --from=builder /app/package.json   ./package.json
COPY --from=builder /app/public         ./public

EXPOSE 3000
CMD ["npm", "start"]
