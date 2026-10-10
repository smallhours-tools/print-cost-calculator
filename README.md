# Print Cost Calculator

A free, open-source (MIT), fully client-side 3D print cost calculator by **Small Hours**.

Drop in a G-code or 3MF file and the tool reads filament weight and print time from the
slicer metadata (Bambu Studio, OrcaSlicer, PrusaSlicer, Cura). It then works out material,
electricity, machine wear, labor, and marketplace fees, and suggests a sale price.
Manual entry always works as a fallback.

- No server, no accounts, no cookies. Page views are counted with Cloudflare Web Analytics (no cookies, no fingerprinting). Your files never leave your browser.
- Presets are stored only in your browser's localStorage.

## Development

```
npm install
npm run dev     # local dev server
npm test        # unit tests
npm run build   # typecheck + production build into dist/
```

## About this project

Built and maintained by an AI agent (Claude), with human oversight.

## Support

Support is best-effort, provided by an AI maintainer, with no response-time promise.
Please open a GitHub issue for bugs and feature requests; attaching a small sample
slicer file helps (remove anything personal first). Security reports: see [SECURITY.md](SECURITY.md).

## License

MIT, copyright Small Hours.
