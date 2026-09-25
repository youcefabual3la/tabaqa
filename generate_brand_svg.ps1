Add-Type -AssemblyName PresentationCore, PresentationFramework, WindowsBase

$gtST = New-Object System.Windows.Media.GlyphTypeface(New-Object System.Uri('d:\tabaqa\assets\STTokyo.ttf'))
$gtLilita = New-Object System.Windows.Media.GlyphTypeface(New-Object System.Uri('d:\tabaqa\assets\LilitaOne.ttf'))

# Box Geometry (origin at 0,0 for the box):
# Outer width = 371.18, height = 371.17
# P0: (0, 0)
# P1: (321.74, 0)
# P2: (371.18, 49.64)
# P3: (371.18, 371.17)
# P4: (49.44, 371.17)
# P5: (0, 321.53)
# Inner cutout:
# I0: (24.87, 24.87)
# I1: (296.96, 24.87)
# I2: (296.96, 296.96)
# I3: (24.87, 296.96)

$boxPath = "M 0,0 L 321.74,0 L 371.18,49.64 L 371.18,371.17 L 49.44,371.17 L 0,321.53 Z M 24.87,24.87 L 296.96,24.87 L 296.96,296.96 L 24.87,296.96 Z"

# Box 'T':
# Inside the box, 'T' sits at:
# X: 38.35, Y: 35.95, Width: 135.0, Height: 128.54
# Glyph 'T' outline from STTokyo (at size 100 pt):
# Bounds of 'T' at 100: X in [5, 78.5], Y in [-70, 0]
# Width = 73.5, Height = 70
# Scale to Width 135.0 -> scale = 135.0 / 73.5 = 1.83673
# Translated so top-left (5, -70) lands at (38.35, 35.95):
# transX = 38.35 - 5 * 1.83673 = 29.17
# transY = 35.95 - (-70) * 1.83673 = 164.52

$gidT = $gtST.CharacterToGlyphMap[[int][char]'T']
$geoT = $gtST.GetGlyphOutline($gidT, 100, 100)

function Transform-Path($geo, $scale, $transX, $transY) {
    $tg = New-Object System.Windows.Media.TransformGroup
    $tg.Children.Add((New-Object System.Windows.Media.ScaleTransform($scale, $scale)))
    $tg.Children.Add((New-Object System.Windows.Media.TranslateTransform($transX, $transY)))
    $clone = $geo.Clone()
    $clone.Transform = $tg
    $s = $clone.ToString()
    if ($s.StartsWith("F1") -or $s.StartsWith("F0")) { $s = $s.Substring(2) }
    return $s
}

$boxTPath = Transform-Path $geoT 1.83673 29.17 164.52

# Word 'T':
# In page coordinates:
# Word 'T' starts at X = 2334.37 - 1928.34 = 406.03
# Word 'T' top = 1643.65 - 1576.68 = 66.97
# Width = 234.58, Height = 223.41
# Scale = 234.58 / 73.5 = 3.19156
# transX = 406.03 - 5 * 3.19156 = 390.07
# transY = 66.97 - (-70) * 3.19156 = 290.38
$wordTPath = Transform-Path $geoT 3.19156 390.07 290.38

# Word 'ABAQA':
# Advances and scale for LilitaOne:
# Lilita glyphs at 100:
# Baseline Y = 290.73 (aligns with Word 'T' baseline)
# Scale: Font size for Lilita is 320.7 pt (height ~224.4 / 70 * 70 = 224.4, scale = 3.207)
# Let's verify character widths:
$gidA = $gtLilita.CharacterToGlyphMap[[int][char]'A']
$gidB = $gtLilita.CharacterToGlyphMap[[int][char]'B']
$gidQ = $gtLilita.CharacterToGlyphMap[[int][char]'Q']

$geoA = $gtLilita.GetGlyphOutline($gidA, 100, 100)
$geoB = $gtLilita.GetGlyphOutline($gidB, 100, 100)
$geoQ = $gtLilita.GetGlyphOutline($gidQ, 100, 100)

$scaleL = 3.207
$baseY = 290.73

# Advances from PDF:
# A1 starts at X = 2562.05 - 1928.34 = 633.71
# B starts at X = 633.71 + 23.631226 * 8.8851776 = 633.71 + 209.97 = 843.68
# A2 starts at X = 843.68 + 21.430466 * 8.8851776 = 843.68 + 190.41 = 1034.09
# Q starts at X = 1034.09 + 23.631226 * 8.8851776 = 1034.09 + 209.97 = 1244.06
# A3 starts at X = 1244.06 + 25.471222 * 8.8851776 = 1244.06 + 226.32 = 1470.38
# End of A3 = 1470.38 + 65.5 * 3.207 = 1680.44

$pathA1 = Transform-Path $geoA $scaleL 633.71 $baseY
$pathB  = Transform-Path $geoB $scaleL 843.68 $baseY
$pathA2 = Transform-Path $geoA $scaleL 1034.09 $baseY
$pathQ  = Transform-Path $geoQ $scaleL 1244.06 $baseY
$pathA3 = Transform-Path $geoA $scaleL 1470.38 $baseY

$totalWidth = [Math]::Round(1685.0)
$totalHeight = [Math]::Round(372.0)

Write-Output "Full Logo Dimensions: $totalWidth x $totalHeight"

# Now write logo.svg (Dark Charcoal #53575A, transparent background)
$logoSvg = @"
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 $totalWidth $totalHeight" width="100%" height="100%">
  <!-- TABAQA BRAND LOGO — CANVA VECTOR EXACT -->
  <g fill="#53575A" fill-rule="evenodd">
    <!-- 3D Layer Block Frame -->
    <path d="$boxPath" />
    <!-- 'T' inside 3D Block -->
    <path d="$boxTPath" />
    <!-- 'TABAQA' Wordmark -->
    <path d="$wordTPath" />
    <path d="$pathA1" />
    <path d="$pathB" />
    <path d="$pathA2" />
    <path d="$pathQ" />
    <path d="$pathA3" />
  </g>
</svg>
"@

Set-Content -Path 'd:\tabaqa\assets\logo.svg' -Value $logoSvg -Encoding UTF8
Write-Output "Written d:\tabaqa\assets\logo.svg"

# Write logo-white.svg (White #FFFFFF for dark footer/dark mode)
$logoWhiteSvg = @"
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 $totalWidth $totalHeight" width="100%" height="100%">
  <!-- TABAQA BRAND LOGO — WHITE VARIANT FOR DARK THEMES -->
  <g fill="#FFFFFF" fill-rule="evenodd">
    <!-- 3D Layer Block Frame -->
    <path d="$boxPath" />
    <!-- 'T' inside 3D Block -->
    <path d="$boxTPath" />
    <!-- 'TABAQA' Wordmark -->
    <path d="$wordTPath" />
    <path d="$pathA1" />
    <path d="$pathB" />
    <path d="$pathA2" />
    <path d="$pathQ" />
    <path d="$pathA3" />
  </g>
</svg>
"@

Set-Content -Path 'd:\tabaqa\assets\logo-white.svg' -Value $logoWhiteSvg -Encoding UTF8
Write-Output "Written d:\tabaqa\assets\logo-white.svg"

# Write mark.svg (Icon only for favicon, mobile app, etc.)
# Box dimensions: 371.18 x 371.17
$markSvg = @"
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 372 372" width="100%" height="100%">
  <!-- TABAQA BRAND MARK — 3D LAYER ICON -->
  <g fill="#53575A" fill-rule="evenodd">
    <path d="$boxPath" />
    <path d="$boxTPath" />
  </g>
</svg>
"@

Set-Content -Path 'd:\tabaqa\assets\mark.svg' -Value $markSvg -Encoding UTF8
Write-Output "Written d:\tabaqa\assets\mark.svg"

# Write mark-white.svg
$markWhiteSvg = @"
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 372 372" width="100%" height="100%">
  <!-- TABAQA BRAND MARK — WHITE -->
  <g fill="#FFFFFF" fill-rule="evenodd">
    <path d="$boxPath" />
    <path d="$boxTPath" />
  </g>
</svg>
"@

Set-Content -Path 'd:\tabaqa\assets\mark-white.svg' -Value $markWhiteSvg -Encoding UTF8
Write-Output "Written d:\tabaqa\assets\mark-white.svg"
