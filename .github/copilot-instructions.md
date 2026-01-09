# Copilot / AI agent instructions for climprocpred.github.io

- Goal: help contributors make focused code/content changes to this Hugo + Wowchemy site and produce small, safe PRs.

Quick context
- This is a Hugo (Extended) static site using the Wowchemy academic theme. Main source is the repository root; generated output is in `public/`.
- Key directories:
  - `assets/` — SCSS and source JS (edit here; Hugo builds/compiles these)
  - `js/` and `css/` — compiled/packaged vendor assets and theme outputs
  - `publication/`, `projects/`, `content/` (Hugo content lives under `content/` and various top-level folders)
  - `admin/config.yml` — NetlifyCMS collections and CMS conventions

What changes an AI agent is allowed to suggest or implement
- Small content fixes (typos, front-matter metadata in `content/*`, `publication/*`, `projects/*`, `authors/*`). Use Hugo new page conventions (e.g. `hugo new publication/my-paper.md`) but edit the markdown directly in the repo when creating PRs.
- Small styling tweaks limited to `assets/scss/custom.scss` or small additions to `assets/js/custom.js`. Keep changes minimal and reversible.
- Build-related updates (npm package metadata, Netlify build hints) only if trivial (bump script, adjust `hugo --minify` commands).

Constraints / safety
- Do NOT edit files under `public/` — these are generated. Commits should change source files (`assets/`, `content/`, `layouts/`, `config/`), not `public/`.
- Avoid large-scale theme upgrades or changing Wowchemy submodule settings without human review. Note: Hugo modules and Wowchemy may be sensitive to version mismatches.
- Don't add external network calls, API keys, or secrets. Respect Netlify/GitHub Pages deployment assumptions.

Developer workflows and commands (examples agents can use or suggest)
- Local dev server (preferred for checks): `hugo server -D` (serves drafts and rebuilds assets)
- Production build: `hugo --minify` (output in `public/`)
- If assets (npm) are present: `npm install` then `hugo server -D` (Hugo Extended compiles SCSS automatically)
- Clear Hugo cache: `hugo --gc` or remove `resources/_gen` and `public/` for a clean build

Project-specific conventions and patterns to follow
- Content front matter examples live in `docs/QUICK_REFERENCE.md` and `docs/DEVELOPMENT_GUIDE.md` — follow fields like `title`, `authors`, `date`, `publication_types`, `image`.
- Author profiles live under `content/authors/` (see `admin/config.yml` collection) and expect a particular front-matter shape (role, bio, social).
- Use BEM-like SCSS structure in `assets/scss/custom.scss` and avoid touching vendor CSS in `css/`.
- Math rendering is configured via `js/mathjax-config.js` — prefer inline $...$ or \(...\) and display $$...$$ for equations.
- Slides use Reveal/Wowchemy (`content/slides/`); changes to slides should preserve triple-dash `---` separators and front-matter.

Files to reference in PR descriptions
- `README.md` — overall instructions
- `docs/DEVELOPMENT_GUIDE.md` and `docs/QUICK_REFERENCE.md` — content templates, Hugo commands, and front-matter examples
- `admin/config.yml` — CMS collections and expected fields
- `assets/scss/custom.scss` and `assets/js/custom.js` — preferred locations for small UI/UX fixes

Edge cases and checks before creating PRs
- Ensure no edits to `public/` are included. If present, remove `public/` changes from the commit.
- When changing SCSS/JS, confirm the dev server builds without template or asset errors (`hugo server -D --verbose`).
- When changing content front matter, validate YAML syntax and required fields for the collection in `admin/config.yml`.
- For changes that touch deployment (netlify.toml, build commands), add a short note explaining why and flag for human review.

If unsure, prefer creating a draft PR and flagging maintainers. Ask for human review for:
- Theme or Hugo version upgrades
- Large refactors of layouts or data models
- Changes that affect site routing, redirects, or headers (`_redirects`, `_headers`)

End: ask the user for feedback if any sections are unclear or need expansion.
