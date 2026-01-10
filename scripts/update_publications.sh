#!/bin/bash
#
# Manual Publication Update Script
# Updates publications from BibTeX file
#
# Usage: ./scripts/update_publications.sh [path_to_bibfile]
#

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}=== Publication Update Script ===${NC}"
echo ""

# Check if academic CLI is installed
if ! command -v academic &> /dev/null; then
    echo -e "${YELLOW}Academic CLI not found. Installing...${NC}"
    pip install -U academic
fi

# Find BibTeX file
if [ -n "$1" ]; then
    BIB_FILE="$1"
elif [ -f "publication/ReadCube_export.bib" ]; then
    BIB_FILE="publication/ReadCube_export.bib"
else
    BIB_FILE=$(find publication -name "*.bib" | head -1)
fi

if [ -z "$BIB_FILE" ] || [ ! -f "$BIB_FILE" ]; then
    echo -e "${RED}Error: No BibTeX file found!${NC}"
    echo "Usage: $0 [path_to_bibfile]"
    exit 1
fi

echo -e "${GREEN}Using BibTeX file: ${BIB_FILE}${NC}"
echo ""

# Backup existing publications
echo -e "${YELLOW}Creating backup...${NC}"
mkdir -p backup
cp -r publication "backup/publication_$(date +%Y%m%d_%H%M%S)" || true

# Import publications
echo -e "${YELLOW}Importing publications...${NC}"
cd publication
academic import --bibtex $(basename "$BIB_FILE") . --overwrite
cd ..

echo ""
echo -e "${GREEN}✓ Publications updated successfully!${NC}"
echo ""
echo "Next steps:"
echo "  1. Review the changes: git status"
echo "  2. Rebuild the site: hugo"
echo "  3. Commit changes: git add . && git commit -m 'Update publications'"
echo "  4. Push to GitHub: git push"
