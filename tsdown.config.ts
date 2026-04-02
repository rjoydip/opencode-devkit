import { defineConfig } from 'tsdown'

export default defineConfig({
  inputOptions: {
    tsconfig: "./tsconfig.json",
  },
  entry: ["index.ts"],
  dts: {
    tsgo: true,
    sourcemap: true,
  },
  exports: true,
})
