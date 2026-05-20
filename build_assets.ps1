$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$paperDir = Join-Path $root "assets\papers"
$imageDir = Join-Path $root "assets\images"
$thumbDir = Join-Path $root "assets\thumbs"

New-Item -ItemType Directory -Force -Path $paperDir, $imageDir, $thumbDir | Out-Null

$paperMap = @(
  @{ slug="dvp-mvs"; source="C:\Users\Administrator\Desktop\paper\AAAI 2025-1\2407.19323v5.pdf" },
  @{ slug="msp-mvs"; source="C:\Users\Administrator\Desktop\paper\AAAI 2025-2\2412.11578v2.pdf" },
  @{ slug="mr-intelliassist"; source="C:\Users\Administrator\Desktop\paper\HCII-MR-IntelliAssist\MR_IntelliAssist.pdf" },
  @{ slug="plat"; source="C:\Users\Administrator\Desktop\paper\HCII-PLAT\PLAT__.pdf" },
  @{ slug="operational-twins"; source="C:\Users\Administrator\Desktop\paper\HCII-From Digital Twins to Operational Twins\Operational_twin.pdf" },
  @{ slug="ldfe-slam"; source="C:\Users\Administrator\Desktop\paper\Machines\LDFE-SLAM\template.pdf" },
  @{ slug="mr-multitwin"; source="C:\Users\Administrator\Desktop\paper\IEEE-CCSSTA 2025-MR-MultiTwin\MR-MultiTwin A Mixed Reality Platform for.pdf" }
)

foreach ($paper in $paperMap) {
  if (Test-Path $paper.source) {
    $target = Join-Path $paperDir "$($paper.slug).pdf"
    Copy-Item -LiteralPath $paper.source -Destination $target -Force
    $prefix = Join-Path $thumbDir $paper.slug
    & pdftoppm -f 1 -singlefile -jpeg -r 140 $target $prefix | Out-Null
  }
}

$imageMap = @(
  @{ name="profile.png"; source="C:\Users\Administrator\Desktop\paper\liuc.png" },
  @{ name="avatar.png"; source="C:\Users\Administrator\Desktop\paper\6814_Cong_Liu_1200.png" },
  @{ name="mr-intelliassist.jpg"; source="C:\Users\Administrator\Desktop\paper\HCII-MR-IntelliAssist\MR-IntelliAssist.jpg" },
  @{ name="mr-intelliassist-before-after.png"; source="C:\Users\Administrator\Desktop\paper\HCII-MR-IntelliAssist\Before and After.png" },
  @{ name="wca-framework.png"; source="C:\Users\Administrator\Desktop\paper\HCII-MR-IntelliAssist\World Cognition Agent (WCA) Framework.png" },
  @{ name="mr-multitwin-demo.jpg"; source="C:\Users\Administrator\Desktop\paper\IEEE-CCSSTA 2025-MR-MultiTwin\e.jpg" },
  @{ name="ldfe-lowlight.png"; source="C:\Users\Administrator\Desktop\paper\Machines\LDFE-SLAM\Figures\lowlight_comparison_4x4.png" },
  @{ name="ldfe-trajectory.png"; source="C:\Users\Administrator\Desktop\paper\Machines\LDFE-SLAM\Figures\paper_main_trajectory.png" },
  @{ name="ldfe-performance.png"; source="C:\Users\Administrator\Desktop\paper\Machines\LDFE-SLAM\Figures\performance_combined.png" }
)

foreach ($image in $imageMap) {
  if (Test-Path $image.source) {
    Copy-Item -LiteralPath $image.source -Destination (Join-Path $imageDir $image.name) -Force
  }
}

Write-Output "Assets built in $root"
