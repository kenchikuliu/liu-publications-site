$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$paperDir = Join-Path $root "assets\papers"
$figureDir = Join-Path $root "assets\figures"

New-Item -ItemType Directory -Force -Path $figureDir | Out-Null

$papers = @(
  "dvp-mvs",
  "msp-mvs",
  "mr-intelliassist",
  "plat",
  "operational-twins",
  "ldfe-slam",
  "mr-multitwin"
)

foreach ($slug in $papers) {
  $pdf = Join-Path $paperDir "$slug.pdf"
  if (-not (Test-Path $pdf)) { continue }

  $out = Join-Path $figureDir $slug
  New-Item -ItemType Directory -Force -Path $out | Out-Null

  $pagePrefix = Join-Path $out "page"
  & pdftoppm -f 1 -l 8 -jpeg -r 130 $pdf $pagePrefix | Out-Null

  $imagePrefix = Join-Path $out "img"
  & pdfimages -png -f 1 -l 10 $pdf $imagePrefix | Out-Null
}

Write-Output "Extracted figures into $figureDir"
