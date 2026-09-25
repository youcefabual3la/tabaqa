Add-Type -AssemblyName PresentationCore, PresentationFramework, WindowsBase
$gt = New-Object System.Windows.Media.GlyphTypeface(New-Object System.Uri('d:\tabaqa\assets\LilitaOne.ttf'))

foreach ($char in @('T', 'A', 'B', 'Q')) {
    $code = [int][char]$char
    if ($gt.CharacterToGlyphMap.ContainsKey($code)) {
        $gid = $gt.CharacterToGlyphMap[$code]
        $geo = $gt.GetGlyphOutline($gid, 100, 100)
        $advance = $gt.AdvanceWidths[$gid] * 100
        Write-Output "Char '$char' GID=$gid Advance=$advance Path: $($geo.ToString())"
    } else {
        Write-Output "Char '$char' not in map directly, dumping all:"
        foreach ($kv in $gt.CharacterToGlyphMap) {
            Write-Output "Code $($kv.Key) GID $($kv.Value)"
        }
    }
}
