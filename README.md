# sss-dev-console

A local Dev Command Center for SmokeSignalSearch (SSS).

## Purpose

- Local GUI for managing prompts, systems, modules, and sub-entities for SSS.
- No backend, no external APIs, all data from local `/data` files.

## Getting Started

npm install
npm run dev

Then open:

http://localhost:3000

## Structure

- /app — Next.js App Router pages
- /components — Layout, cards, tables, editor
- /lib — Typed schemas and local storage helpers
- /data — JSON + Markdown config and prompt data
- /styles — Global Tailwind + neon theme

---

## Usage & Deployment

### Local development

```bash
npm install       # or: npm ci (if package-lock.json is present)
npm run dev
```

Open http://localhost:3000 in your browser.

### Production build (Node.js)

```bash
npm ci
npm run build
npm start         # listens on port 3000 by default
```

### Docker

Build and run the production image locally:

```bash
docker build -t sss-dev-console:latest .
docker run -p 3000:3000 sss-dev-console:latest
```

Pass environment variables with `--env-file .env.local` if your app requires them.

### CI (GitHub Actions)

A CI workflow (`.github/workflows/ci.yml`) runs automatically on every push to
`main` and on all pull requests targeting `main`.  It installs dependencies,
runs `npm run lint`, and runs `npm run build`.

### Deploy to Vercel (optional)

A Vercel deploy workflow (`.github/workflows/deploy-vercel.yml`) is included but
**disabled by default**.  To enable it:

1. Run `vercel link` inside the project directory to generate `.vercel/project.json`.
2. Add the following secrets in **GitHub → Settings → Secrets and variables → Actions**:
   - `VERCEL_TOKEN` — your Vercel personal access token
   - `VERCEL_ORG_ID` — the `orgId` from `.vercel/project.json`
   - `VERCEL_PROJECT_ID` — the `projectId` from `.vercel/project.json`
3. In `.github/workflows/deploy-vercel.yml`, remove (or comment out) the
   `if: false` line in the `deploy` job.

The workflow will then deploy to Vercel production on every push to `main`.

#### Container registry (future)

To publish the Docker image to GitHub Container Registry (GHCR), add a workflow
that runs `docker/build-push-action` and authenticate with a `CR_PAT` or
`GITHUB_TOKEN` secret.  Reach out or open an issue if you need this workflow added.