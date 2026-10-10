// Pro: named printer/material profiles for the cost settings, with JSON import/export.
// Written by an AI agent (Claude). Profiles live in localStorage and pass through the strict importer on every load.
import { exportProfiles, importProfiles, remove, upsert, MAX_IMPORT_BYTES, type Profile, type ProfileValues } from './profiles';

const STORE = 'pcc.pro.profiles.v1';

/** Load stored profiles; anything that fails validation is dropped rather than trusted. */
export function loadProfiles(raw: string | null): Profile[] {
  if (!raw) return [];
  try { return importProfiles(raw); } catch { return []; }
}

export function mountProfiles(fieldset: HTMLElement, read: () => ProfileValues, write: (v: ProfileValues) => void) {
  let list: Profile[];
  try { list = loadProfiles(localStorage.getItem(STORE)); } catch { list = []; }
  const save = () => { try { localStorage.setItem(STORE, exportProfiles(list)); } catch { status.textContent = 'This browser is not saving data, so profiles last only until you close the page.'; } };

  const mk = <K extends keyof HTMLElementTagNameMap>(tag: K, props: Record<string, unknown> = {}) => Object.assign(document.createElement(tag), props) as HTMLElementTagNameMap[K];
  const select = mk('select', { id: 'p-select' });
  const name = mk('input', { id: 'p-name', type: 'text', maxLength: 60, placeholder: 'e.g. P1S PETG' });
  const saveBtn = mk('button', { type: 'button', id: 'p-save', textContent: 'Save current settings' });
  const delBtn = mk('button', { type: 'button', id: 'p-delete', textContent: 'Delete' });
  const expBtn = mk('button', { type: 'button', id: 'p-export', textContent: 'Export JSON' });
  const imp = mk('input', { type: 'file', id: 'p-import', accept: '.json,application/json' });
  const status = mk('p', { className: 'note', role: 'status' });
  const label = (text: string, ctl: HTMLElement) => { const l = mk('label', { textContent: text }); l.append(ctl); return l; };
  const impLabel = label('Import JSON', imp);

  const box = mk('div', { id: 'pro-profiles', className: 'grid' });
  box.style.gridColumn = '1 / -1';
  const actions = mk('p');
  actions.append(saveBtn, ' ', delBtn, ' ', expBtn);
  box.append(label('Profile (Pro preview)', select), label('Name for saving', name), actions, impLabel, status);
  fieldset.querySelector('legend')!.after(box);

  function fill(selected = '') {
    const opt = (value: string, text: string) => mk('option', { value, textContent: text, selected: value === selected });
    select.replaceChildren(opt('', list.length ? 'Choose a saved profile…' : 'No saved profiles yet'), ...list.map((p) => opt(p.name, p.name)));
    delBtn.disabled = !selected;
  }

  select.addEventListener('change', () => {
    const p = list.find((x) => x.name === select.value);
    delBtn.disabled = !p;
    if (!p) return;
    write(p.values);
    name.value = p.name;
    status.textContent = `Loaded "${p.name}".`;
  });
  saveBtn.addEventListener('click', () => {
    try {
      list = upsert(list, name.value || select.value, read());
      const saved = list.find((p) => p.name.toLowerCase() === (name.value || select.value).trim().replace(/\s+/g, ' ').toLowerCase());
      save(); fill(saved?.name ?? '');
      status.textContent = `Saved "${saved?.name ?? ''}".`;
    } catch (e) { status.textContent = e instanceof Error ? e.message : 'Could not save'; }
  });
  delBtn.addEventListener('click', () => {
    if (!select.value) return;
    const n = select.value;
    list = remove(list, n); save(); fill();
    status.textContent = `Deleted "${n}".`;
  });
  expBtn.addEventListener('click', () => {
    const url = URL.createObjectURL(new Blob([exportProfiles(list)], { type: 'application/json' }));
    const a = mk('a', { href: url, download: 'smallhours-profiles.json' });
    document.body.append(a); a.click(); a.remove();
    setTimeout(() => URL.revokeObjectURL(url), 1000);
  });
  imp.addEventListener('change', async () => {
    const f = imp.files?.[0];
    imp.value = '';
    if (!f) return;
    try {
      if (f.size > MAX_IMPORT_BYTES) throw new Error('File too large');
      const incoming = importProfiles(await f.text());
      for (const p of incoming) list = upsert(list, p.name, p.values);
      save(); fill();
      status.textContent = `Imported ${incoming.length} profile(s). Profiles with the same name were replaced.`;
    } catch (e) { status.textContent = `Import failed: ${e instanceof Error ? e.message : 'unreadable file'}. Nothing was changed.`; }
  });
  fill();
}
