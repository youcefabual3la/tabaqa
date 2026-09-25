Add-Type -AssemblyName PresentationCore, PresentationFramework, WindowsBase

$boxPath = "M 0,0 L 321.74,0 L 371.18,49.64 L 371.18,371.17 L 49.44,371.17 L 0,321.53 Z M 24.87,24.87 L 296.96,24.87 L 296.96,296.96 L 24.87,296.96 Z"
$tPath   = "M 5,-70 L 78.5,-70 L 78.5,-34.9 L 60.5,-34.9 L 60.5,-52 L 50.8,-52 L 50.8,0 L 32.8,0 L 32.8,-52 L 23,-52 L 23,-28.9 L 5,-28.9 Z"

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

# Render preview using DrawingVisual with PushTransform
$dv = New-Object System.Windows.Media.DrawingVisual
$dc = $dv.RenderOpen()

# Scale factor for 800px preview width: 800 / 1700 = 0.470588
$scale = 800.0 / 1700.0
$dc.PushTransform((New-Object System.Windows.Media.ScaleTransform($scale, $scale)))

# White background
$dc.DrawRectangle([System.Windows.Media.Brushes]::White, $null, (New-Object System.Windows.Rect(0, 0, 1700, 372)))

$brush = New-Object System.Windows.Media.SolidColorBrush([System.Windows.Media.Color]::FromRgb(83, 87, 90))

# 1. Box
$dc.DrawGeometry($brush, $null, [System.Windows.Media.Geometry]::Parse($boxPath))

# 2. Helper to draw transformed geometry
function Draw-Part($pathStr, [double]$sx, [double]$sy, [double]$tx, [double]$ty) {
    $dc.PushTransform((New-Object System.Windows.Media.TranslateTransform($tx, $ty)))
    $dc.PushTransform((New-Object System.Windows.Media.ScaleTransform($sx, $sy)))
    $dc.DrawGeometry($brush, $null, [System.Windows.Media.Geometry]::Parse($pathStr))
    $dc.Pop()
    $dc.Pop()
}

# Box 'T'
Draw-Part $tPath 1.83673 1.83673 29.17 164.52

# Wordmark 'TABAQA'
Draw-Part $tPath 3.19156 3.19156 390.07 290.38
Draw-Part $aPath 3.207   3.207   633.71 290.73
Draw-Part $bPath 3.207   3.207   843.68 290.73
Draw-Part $aPath 3.207   3.207   1034.09 290.73
Draw-Part $qPath 3.207   3.207   1244.06 290.73
Draw-Part $aPath 3.207   3.207   1470.38 290.73

$dc.Pop() # Pop the 0.47 scale
$dc.Close()

$width = [int](1700.0 * $scale)
$height = [int](372.0 * $scale)

$rtb = New-Object System.Windows.Media.Imaging.RenderTargetBitmap($width, $height, 96, 96, [System.Windows.Media.PixelFormats]::Pbgra32)
$rtb.Render($dv)

$enc = New-Object System.Windows.Media.Imaging.PngBitmapEncoder
$enc.Frames.Add([System.Windows.Media.Imaging.BitmapFrame]::Create($rtb))
$fs = [System.IO.File]::Create('d:\tabaqa\assets\preview_logo.png')
$enc.Save($fs)
$fs.Close()

Write-Output "Successfully saved preview_logo.png ($width x $height)"
