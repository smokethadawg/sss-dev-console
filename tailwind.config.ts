import type { Config } from "tailwindcss";

const config: Config = {
  darkMode: "class",
  content: [
    "./app/**/*.{ts,tsx,js,jsx}",
    "./components/**/*.{ts,tsx,js,jsx}"
  ],
  theme: {
    extend: {
      colors: {
        neon: {
          blue: "#38bdf8",
          purple: "#a855f7",
          cyan: "#22d3ee"
        },
        background: "#020617",
        surface: "#020617"
      }
    }
  },
  plugins: []
};

export default config;
