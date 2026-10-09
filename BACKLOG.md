# Backlog (owner-approved future items; do NOT work on these unless STATE.md says so)

- **Email:** domain mail is on Fastmail. Planned approval queue: the agent only writes drafts using a token with no send scope; the owner releases each one. Inbound mail needs a layered prompt-injection sanitizer before any agent reads outside email: SPF/DKIM/DMARC plus spam filtering, injection classifiers tuned to high recall, a sandboxed local canary model, and a quarantined no-tools reader that outputs fixed-schema fields only. The privileged agent never sees raw text. Bias toward false positives.
- Tighten the DMARC policy from p=none once sending is set up.
- Custom domain for this tool on smallhourstools.com.
- Follow-up tools in the same niche: G-code viewer, STL viewer.
- Before any paid product: use a merchant of record (Lemon Squeezy/Paddle), instant refunds, no user accounts where possible, and an owner-privacy review (EU imprint rules / LLC).
