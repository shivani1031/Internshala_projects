#!/bin/bash

# Download the latest NAV data
curl -s https://www.amfiindia.com/spages/NAVAll.txt -o NAVAll.txt

# Extract Scheme Name and Asset Value (NAV) and save as TSV
awk -F ';' '
    BEGIN { OFS="\t"; print "Scheme Name", "Net Asset Value" }
    NR > 1 && NF > 4 && $1 ~ /^[0-9]+$/ {
        print $4, $5
    }
' NAVAll.txt > scheme_nav.tsv

echo "✅ Extracted data saved to scheme_nav.tsv"
