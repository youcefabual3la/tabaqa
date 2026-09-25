Add-Type -AssemblyName PresentationCore, PresentationFramework, WindowsBase

$ttfPath = 'd:\tabaqa\assets\LilitaOne.ttf'
$uri = New-Object System.Uri($ttfPath)
$gt = New-Object System.Windows.Media.GlyphTypeface($uri)

Write-Output "GlyphTypeface loaded: $($gt.FamilyNames[[System.Globalization.CultureInfo]::CurrentCulture])"
Write-Output "Number of glyphs: $($gt.GlyphCount)"

foreach ($kv in $gt.CharacterToGlyphMap) {
    $char = [char]$kv.Key
    $gid = $kv.Value
    $geo = $gt.GetGlyphOutline($gid, 100, 100) # size 100
    Write-Output "Char: '$char' (GID $gid) -> Path: $($geo.ToString())"
}

$ttfPath2 = 'd:\tabaqa\assets\STTokyo.ttf'
$uri2 = New-Object System.Uri($ttfPath2)
$gt2 = New-Object System.Windows.Media.GlyphTypeface($uri2)

Write-Output "=== ST-Tokyo ==="
foreach ($kv in $gt2.CharacterToGlyphMap) {
    $char = [char]$kv.Key
    $gid = $kv.Value
    $geo = $gt2.GetGlyphOutline($gid, 100, 100)
    Write-Output "Char: '$char' (GID $gid) -> Path: $($geo.ToString())"
}
