# Publication Update System

This document explains how to maintain and update the publications list on the website.

## Overview

The website uses an automated system to keep publications up-to-date using:
- **GitHub Actions**: Automatically imports publications weekly
- **BibTeX Import**: Converts BibTeX entries to Hugo-compatible markdown
- **Academic CLI**: Wowchemy's tool for managing publication content

## Automated Updates (GitHub Actions)

### How It Works

The workflow [`.github/workflows/update-publications.yml`](../.github/workflows/update-publications.yml) runs:

1. **Weekly** - Every Monday at 2 AM UTC
2. **On BibTeX updates** - When you push changes to `publication/*.bib`
3. **Manually** - Trigger from GitHub Actions tab

### Triggering Manual Updates

1. Go to your repository on GitHub
2. Click **Actions** tab
3. Select **Update Publications from BibTeX**
4. Click **Run workflow** button
5. Wait for completion (~2-3 minutes)

### Viewing Workflow Results

- Check the **Actions** tab to see workflow runs
- Click on any run to see detailed logs
- Summary shows: BibTeX file used, changes detected, status

## Manual Updates (Local)

### Quick Update

```bash
# Run the update script
./scripts/update_publications.sh

# Or specify a custom BibTeX file
./scripts/update_publications.sh path/to/my_publications.bib
```

### Step-by-Step Manual Process

1. **Export your publications to BibTeX**
   - From ReadCube: File → Export → BibTeX
   - From Zotero: Right-click collection → Export → Better BibTeX
   - From Mendeley: File → Export → BibTeX

2. **Place BibTeX file in the repository**
   ```bash
   cp ~/Downloads/my_publications.bib publication/ReadCube_export_$(date +%Y-%m-%d).bib
   ```

3. **Run the import**
   ```bash
   pip install -U academic
   cd publication
   academic import --bibtex ReadCube_export_2026-01-09.bib --overwrite
   cd ..
   ```

4. **Rebuild the site** (optional, for preview)
   ```bash
   hugo server
   ```

5. **Commit and push**
   ```bash
   git add publication/
   git commit -m "Update publications from BibTeX"
   git push
   ```

## Reference Manager Integration

### ReadCube Papers

1. Keep your library updated in ReadCube
2. Export regularly: File → Export → BibTeX
3. Save to `publication/` directory in your repo
4. Push to GitHub - workflow will auto-update

### Zotero with Better BibTeX

1. Install [Better BibTeX plugin](https://retorque.re/zotero-better-bibtex/)
2. Set up auto-export:
   - Right-click collection → Export Collection
   - Format: Better BibTeX
   - Check "Keep updated"
   - Save to your repo: `publication/zotero_export.bib`
3. Set up git sync or manual sync periodically

### Mendeley

1. File → Export → BibTeX
2. Save to `publication/mendeley_export.bib`
3. Commit and push to trigger workflow

## ORCID Integration

For automatic fetching from ORCID (requires Python script):

```python
# Save as scripts/fetch_from_orcid.py
import requests
import sys

ORCID_ID = "YOUR-ORCID-ID"  # e.g., "0000-0002-xxxx-xxxx"

def fetch_orcid_bibtex(orcid_id):
    """Fetch publications from ORCID and save as BibTeX"""
    url = f"https://pub.orcid.org/v3.0/{orcid_id}/works"
    headers = {"Accept": "application/json"}

    response = requests.get(url, headers=headers)
    if response.status_code == 200:
        works = response.json()
        print(f"Fetched {len(works.get('group', []))} works")
        # Further processing needed to convert to BibTeX
    else:
        print(f"Error: {response.status_code}")
        sys.exit(1)

if __name__ == "__main__":
    fetch_orcid_bibtex(ORCID_ID)
```

## Troubleshooting

### Workflow Fails

1. **Check the Actions log** for specific errors
2. **Common issues**:
   - Invalid BibTeX syntax - validate your .bib file
   - Missing file - ensure .bib file is committed
   - Permission issues - check repository settings

### Publications Don't Appear

1. **Rebuild the site**: `hugo` (if testing locally)
2. **Check file structure**: Each publication should have its own folder in `publication/`
3. **Verify markdown**: Look for `index.md` in publication folders
4. **GitHub Pages**: Wait 2-5 minutes for deployment

### Duplicate Publications

- Use `--overwrite` flag to replace existing entries
- Or manually delete old publication folders before importing

### Import Errors

```bash
# If academic CLI has issues, try:
pip install -U academic --force-reinstall

# Check Python version (requires 3.6+)
python --version

# Verify BibTeX syntax
pip install bibtexparser
python -c "import bibtexparser; bibtexparser.load(open('publication/your_file.bib'))"
```

## File Structure

```
publication/
├── ReadCube_export.bib              # Your BibTeX file
├── author-2023-title/                # Auto-generated folders
│   ├── index.md                      # Publication metadata
│   └── cite.bib                      # BibTeX for this pub
├── another-2024-paper/
│   ├── index.md
│   ├── cite.bib
│   └── featured.jpg                  # Optional cover image
└── ...
```

## Best Practices

1. **Keep a master BibTeX file** in your reference manager
2. **Export regularly** (weekly/monthly) to catch new publications
3. **Use consistent naming** for BibTeX files (e.g., `ReadCube_export_YYYY-MM-DD.bib`)
4. **Review changes** before pushing (check for duplicates, formatting)
5. **Add featured images** to publication folders for better presentation
6. **Update metadata** in `index.md` if needed (abstract, authors, etc.)

## Workflow Customization

To change the schedule, edit `.github/workflows/update-publications.yml`:

```yaml
on:
  schedule:
    # Run daily at 3 AM
    - cron: '0 3 * * *'

    # Run on 1st of every month
    - cron: '0 0 1 * *'
```

## Support

- **Academic CLI Docs**: https://github.com/wowchemy/hugo-academic-cli
- **Wowchemy Docs**: https://wowchemy.com/docs/
- **Hugo Docs**: https://gohugo.io/documentation/

## Quick Reference

| Task | Command |
|------|---------|
| Manual update | `./scripts/update_publications.sh` |
| Install academic CLI | `pip install -U academic` |
| Import BibTeX | `academic import --bibtex file.bib` |
| Preview site | `hugo server` |
| Build site | `hugo` |
| Check workflow | Visit Actions tab on GitHub |
