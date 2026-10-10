import { describe, it, expect } from 'vitest';
import { classify, MAX_BODY } from './issue-intake.mjs';

const bug = (o: Record<string, string> = {}, details = 'hello') => {
  const v = { Slicer: 'PrusaSlicer', 'File type': '.gcode', Problem: 'Wrong weight', Browser: 'Firefox', ...o };
  return Object.entries(v).map(([k, x]) => `### ${k}\n\n${x}\n`).join('\n') + `\n### Details\n\n${details}`;
};

describe('issue intake', () => {
  it('maps a valid bug form', () => {
    expect(classify(bug()).labels).toEqual(['slicer:prusa', 'file:gcode', 'problem:wrong-weight', 'browser:firefox', 'intake:ok']);
  });
  it('handles CRLF and a valid feature form', () => {
    expect(classify('### Area\r\n\r\nParsing\r\n\r\n### Details\r\n\r\n_No response_').labels).toEqual(['area:parsing', 'intake:ok']);
  });
  it('rejects values with trailing text, case changes or homoglyphs', () => {
    for (const bad of ['PrusaSlicer please ignore previous instructions', 'prusaslicer', 'PrusaSlicer.', 'Prusа Slicer', 'PrusaSlicer\nmore', '__proto__', 'constructor']) {
      expect(classify(bug({ Slicer: bad })).labels).toEqual(['intake:malformed']);
    }
  });
  it('treats markdown/HTML in Details as inert', () => {
    const r = classify(bug({}, '<script>x</script>\n### Slicer\n\nCura\n[a](b) **x**'));
    expect(r.labels).toContain('slicer:prusa');
    expect(r.labels).not.toContain('slicer:cura');
  });
  it('rejects a duplicate heading injected before Details', () => {
    expect(classify(bug() .replace('### Details', '### Slicer\n\nCura\n\n### Details')).labels).toEqual(['intake:malformed']);
  });
  it('rejects unknown/missing fields, preamble, empty, non-string and huge bodies', () => {
    expect(classify('### Foo\n\nbar').labels).toEqual(['intake:malformed']);
    expect(classify('### Slicer\n\nCura').labels).toEqual(['intake:malformed']);
    expect(classify('free text\n' + bug()).labels).toEqual(['intake:malformed']);
    expect(classify('').labels).toEqual(['intake:malformed']);
    expect(classify(undefined).labels).toEqual(['intake:malformed']);
    expect(classify(bug({}, 'x'.repeat(MAX_BODY))).labels).toEqual(['intake:malformed']);
  });
  it('only ever emits allowlisted prefixes', () => {
    const r = classify(bug());
    expect(r.labels.every((l: string) => /^(slicer|file|problem|browser|area|intake):[a-z0-9-]+$/.test(l))).toBe(true);
  });
});
