# Print Cost Calculator

A free, open-source (MIT), fully client-side 3D print cost calculator by **Small Hours**.

**Use it:** [smallhourstools.com/print-cost-calculator](https://smallhourstools.com/print-cost-calculator/)
· [Guides](https://smallhourstools.com/print-cost-calculator/guides/)
· [How accurate is it? Every test file and result](https://smallhourstools.com/print-cost-calculator/testing/)

Drop in a sliced file and the tool reads filament weight and print time from the slicer
metadata. It reads G-code (.gcode) from PrusaSlicer, OrcaSlicer, Bambu Studio and Cura,
PrusaSlicer binary G-code (.bgcode), sliced .3mf files from Bambu Studio / OrcaSlicer, and
UltiMaker .ufp packages. It then works out material, electricity, machine wear, labor, and
marketplace fees, and suggests a sale price. Plain 3D models and unsliced projects have no
print time yet, so slice them first; manual entry always works as a fallback.

Files we sliced ourselves in four slicers ([test-corpus/slicer-matrix/](test-corpus/slicer-matrix/))
are checked on every change: the calculator must read the same weight and time the slicer
states. The [accuracy page](https://smallhourstools.com/print-cost-calculator/testing/) lists
every file and result.

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
