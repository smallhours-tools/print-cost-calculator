// Tests for quote UI helpers. Written by an AI agent (Claude).
import { describe, it, expect } from 'vitest';
import { loadSaved, today } from './quote-ui';

describe('quote ui helpers', () => {
  it('loads saved quote settings defensively', () => {
    expect(loadSaved(null)).toEqual({ seller: '', validDays: 30, terms: '' });
    expect(loadSaved('not json')).toEqual({ seller: '', validDays: 30, terms: '' });
    expect(loadSaved(JSON.stringify({ seller: 5, validDays: 'x', terms: {} }))).toEqual({ seller: '', validDays: 30, terms: '' });
    expect(loadSaved(JSON.stringify({ seller: 'S'.repeat(500), validDays: 9999, terms: 'Net 7' }))).toEqual({ seller: 'S'.repeat(120), validDays: 365, terms: 'Net 7' });
    expect(loadSaved(JSON.stringify({ validDays: -3 })).validDays).toBe(30);
  });
  it('formats a local ISO date', () => expect(today(new Date(2026, 0, 5))).toBe('2026-01-05'));
});
