# Cong Liu Publications Site

Static publication website generated from local paper materials.

## Source folders

- `C:\Users\Administrator\Desktop\paper`
- `C:\Users\Administrator\Desktop\paper\毕业论文\phd-thesis-writing\dissertation\backmatter\publications.tex`

## Local preview

```powershell
python -m http.server 8010
```

Then open `http://localhost:8010`.

## Rebuild copied assets

```powershell
powershell -ExecutionPolicy Bypass -File .\build_assets.ps1
```

## Before publishing

Verify final author order, venue status, PDF redistribution permissions, and whether accepted-but-not-published papers should expose full PDFs publicly.
