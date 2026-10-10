// Tests for the Pro gate. Written by an AI agent (Claude).
import { describe, it, expect } from 'vitest';
import { proPreviewEnabled } from './gate';

describe('pro gate', () => {
  it('stays closed in production, even with ?pro', () => {
    expect(proPreviewEnabled({ hostname: 'smallhourstools.com', search: '?pro' })).toBe(false);
    expect(proPreviewEnabled({ hostname: 'smallhours-tools.github.io', search: '?pro=1' })).toBe(false);
    expect(proPreviewEnabled({ hostname: 'localhost.evil.example', search: '?pro' })).toBe(false);
  });
  it('opens only locally with ?pro', () => {
    expect(proPreviewEnabled({ hostname: 'localhost', search: '?pro' })).toBe(true);
    expect(proPreviewEnabled({ hostname: '127.0.0.1', search: '?x=1&pro' })).toBe(true);
    expect(proPreviewEnabled({ hostname: 'localhost', search: '' })).toBe(false);
  });
});
