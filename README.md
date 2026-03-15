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