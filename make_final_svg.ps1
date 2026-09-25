Add-Type -AssemblyName PresentationCore, PresentationFramework, WindowsBase

# Paths:
$boxPath = "M 0,0 L 321.74,0 L 371.18,49.64 L 371.18,371.17 L 49.44,371.17 L 0,321.53 Z M 24.87,24.87 L 296.96,24.87 L 296.96,296.96 L 24.87,296.96 Z"
$tPath = "M 5,-70 L 78.5,-70 L 78.5,-34.9 L 60.5,-34.9 L 60.5,-52 L 50.8,-52 L 50.8,0 L 32.8,0 L 32.8,-52 L 23,-52 L 23,-28.9 L 5,-28.9 Z"

$gtLilita = New-Object System.Windows.Media.GlyphTypeface(New-Object System.Uri('d:\tabaqa\assets\LilitaOne.ttf'))
function Get-Path($char) {
    $gid = $gtLilita.CharacterToGlyphMap[[int][char]$char]
    $g = $gtLilita.GetGlyphOutline($gid, 100, 100)
    $s = $g.ToString()
    if ($s.StartsWith("F1") -or $s.StartsWith("F0")) { $s = $s.Substring(2) }
    return $s
}

$aPath = Get-Path 'A'
$bPath = Get-Path 'B'
$qPath = Get-Path 'Q'

# Box:
# 3D block: origin 0,0, width 371.18, height 371.17
# Box T: translate(29.17, 164.52) scale(1.83673)
# Word T: translate(390.07, 290.38) scale(3.19156)
# Word A1: translate(633.71, 290.73) scale(3.207)
# Word B:  translate(843.68, 290.73) scale(3.207)
# Word A2: translate(1034.09, 290.73) scale(3.207)
# Word Q:  translate(1244.06, 290.73) scale(3.207)
# Word A3: translate(1470.38, 290.73) scale(3.207)

$totalWidth = 1700
$totalHeight = 372

function Build-Svg($fillColor) {
    return @"
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 $totalWidth $totalHeight" width="100%" height="100%">
  <!-- TABAQA OFFICIAL LOGO -->
  <g fill="$fillColor" fill-rule="evenodd">
    <!-- 3D Layer Block Frame -->
    <path d="$boxPath" />
    <!-- 'T' inside 3D Block -->
    <path d="$tPath" transform="translate(29.17, 164.52) scale(1.83673)" />
    <!-- 'TABAQA' Wordmark -->
    <path d="$tPath" transform="translate(390.07, 290.38) scale(3.19156)" />
    <path d="$aPath" transform="translate(633.71, 290.73) scale(3.207)" />
    <path d="$bPath" transform="translate(843.68, 290.73) scale(3.207)" />
    <path d="$aPath" transform="translate(1034.09, 290.73) scale(3.207)" />
    <path d="$qPath" transform="translate(1244.06, 290.73) scale(3.207)" />
    <path d="$aPath" transform="translate(1470.38, 290.73) scale(3.207)" />
  </g>
</svg>
"@
}

Set-Content -Path 'd:\tabaqa\assets\logo.svg' -Value (Build-Svg '#53575A') -Encoding UTF8
Set-Content -Path 'd:\tabaqa\assets\logo-white.svg' -Value (Build-Svg '#FFFFFF') -Encoding UTF8

# Mark only:
$markSvg = @"
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 372 372" width="100%" height="100%">
  <!-- TABAQA BRAND MARK -->
  <g fill="#53575A" fill-rule="evenodd">
    <path d="$boxPath" />
    <path d="$tPath" transform="translate(29.17, 164.52) scale(1.83673)" />
  </g>
</svg>
"@
Set-Content -Path 'd:\tabaqa\assets\mark.svg' -Value $markSvg -Encoding UTF8

$markWhiteSvg = @"
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 372 372" width="100%" height="100%">
  <!-- TABAQA BRAND MARK — WHITE -->
  <g fill="#FFFFFF" fill-rule="evenodd">
    <path d="$boxPath" />
    <path d="$tPath" transform="translate(29.17, 164.52) scale(1.83673)" />
  </g>
</svg>
"@
Set-Content -Path 'd:\tabaqa\assets\mark-white.svg' -Value $markWhiteSvg -Encoding UTF8

Write-Output "Generated clean SVGs with transforms!"

# Now render to PNG for visual verification
$drawingVisual = New-Object System.Windows.Media.DrawingVisual
$dc = $drawingVisual.RenderOpen()

# Draw background white for preview
$dc.DrawRectangle([System.Windows.Media.Brushes]::White, $null, (New-Object System.Windows.Rect(0, 0, 850, 186)))

# Draw geometry
$brush = New-Object System.Windows.Media.SolidColorBrush([System.Windows.Media.Color]::FromRgb(83, 87, 90))

function Add-Geom($pathStr, $scale, $tx, $ty) {
    $geo = [System.Windows.Media.Geometry]::Parse($pathStr)
    $tg = New-Object System.Windows.Media.TransformGroup
    $tg.Children.Add((New-Object System.Windows.Media.ScaleTransform($scale * 0.5, $scale * 0.5)))
    $tg.Children.Add((New-Object System.Windows.Media.TranslateTransform($tx * 0.5, $ty * 0.5)))
    $geo.Transform = $tg
    return $geo
}

$grp = New-Object System.Windows.Media.GeometryGroup
$grp.FillRule = [System.Windows.Media.FillRule]::EvenOdd
$grp.Children.Add((Add-Geom $boxPath 1 0 0))
$grp.Children.Add((Add-Geom $tPath 1.83673 29.17 164.52))
$grp.Children.Add((Add-Geom $tPath 3.19156 390.07 290.38))
$grp.Children.Add((Add-Geom $aPath 3.207 633.71 290.73))
$grp.Children.Add((Add-Geom $bPath 3.207 843.68 290.73))
$grp.Children.Add((Add-Geom $aPath 3.207 1034.09 290.73))
$grp.Children.Add((Add-Geom $qPath 3.207 1244.06 290.73))
$grp.Children.Add((Add-Geom $aPath 3.207 1470.38 290.73))

$dc.DrawGeometry($brush, $null, $grp)
$dc.Close()

$rtb = New-Object System.Windows.Media.Imaging.RenderTargetBitmap(850, 186, 96, 96, [System.Windows.Media.PixelFormats]::Pbgra32)
$rtb.Render($drawingVisual)

$enc = New-Object System.Windows.Media.Imaging.PngBitmapEncoder
$enc.Frames.Add([System.Windows.Media.Imaging.BitmapFrame]::Create($rtb))
$fs = [System.IO.File]::Create('d:\tabaqa\assets\preview_logo.png')
$enc.Save($fs)
$fs.Close()

Write-Output "Saved d:\tabaqa\assets\preview_logo.png"
