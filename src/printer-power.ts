// Typical average power while printing PLA, for printers named in the file's metadata (hq t013).
// Written by an AI agent (Claude). Figures and sources: docs/reference-data.md "Printer power".
export interface PowerHint { watts: number; label: string }

const norm = (s: string) => s.toLowerCase().replace(/[^a-z0-9]+/g, ' ').trim();

// Bambu Lab wiki, "Printer and AMS power parameters" (PLA column). Longest names first so "a1 mini" beats "a1".
const BAMBU: [string, number, string][] = [
  ['a1 mini', 80, 'Bambu Lab A1 mini'], ['x1 carbon', 105, 'Bambu Lab X1 Carbon'], ['x1e', 185, 'Bambu Lab X1E'],
  ['x1c', 105, 'Bambu Lab X1C'], ['x1', 105, 'Bambu Lab X1'], ['p1p', 110, 'Bambu Lab P1P'], ['p1s', 105, 'Bambu Lab P1S'],
  ['p2s', 200, 'Bambu Lab P2S'], ['h2d', 197, 'Bambu Lab H2D'], ['a1', 95, 'Bambu Lab A1'],
];

/** A sourced PLA power figure for the printer model, or undefined when we have none. */
export function powerHint(model?: string): PowerHint | undefined {
  if (!model) return undefined;
  const m = norm(model);
  const bambu = /^bambu lab (.+)$/.exec(m);
  if (bambu) {
    const hit = BAMBU.find(([k]) => bambu[1] === k);
    return hit ? { watts: hit[1], label: hit[2] } : undefined;
  }
  // Prusa knowledge base: MK-series printers average about 80 W with PLA. PrusaSlicer writes codes like MK4S, MK3S, MK4IS.
  const mk = /^(?:original )?(?:prusa )?(mk\s?[34](?:\s?5)?[a-z]*)$/.exec(m);
  if (mk) return { watts: 80, label: `Prusa ${mk[1].replace(/\s/g, '').replace(/^mk35/, 'mk3.5').toUpperCase()}` };
  return undefined;
}
