$bytes = [System.IO.File]::ReadAllBytes('C:\Users\Specialist\.gemini\antigravity\brain\b4687551-b8ea-43e5-8735-75323e41c3af\.user_uploaded\media_1790369850693.pdf')
$str = [System.Text.Encoding]::ASCII.GetString($bytes)
$matches = [regex]::Matches($str, '(?s)(\d+\s+\d+\s+obj.*?endobj)')
foreach ($m in $matches) {
    if ($m.Value -match '/Subtype' -or $m.Value -match '/XObject' -or $m.Value -match '/Font') {
        $val = $m.Value
        if ($val.Length -gt 400) { $val = $val.Substring(0, 400) }
        Write-Output "--- OBJ ---"
        Write-Output $val
    }
}
