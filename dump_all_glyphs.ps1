Add-Type -AssemblyName PresentationCore, PresentationFramework, WindowsBase
$gt = New-Object System.Windows.Media.GlyphTypeface(New-Object System.Uri('d:\tabaqa\assets\LilitaOne.ttf'))

for ($gid = 0; $gid -lt $gt.GlyphCount; $gid++) {
    $geo = $gt.GetGlyphOutline($gid, 100, 100)
    $adv = $gt.AdvanceWidths[$gid] * 100
    if ($geo.ToString().Length -gt 5) {
        Write-Output "GID $($gid) Advance=$adv PathLength=$($geo.ToString().Length) PathStart=$($geo.ToString().Substring(0, [Math]::Min(50, $geo.ToString().Length)))"
    }
}
