$bytes = [System.IO.File]::ReadAllBytes('C:\Users\Specialist\.gemini\antigravity\brain\b4687551-b8ea-43e5-8735-75323e41c3af\.user_uploaded\media_1790369850693.pdf')
$str = [System.Text.Encoding]::ASCII.GetString($bytes)

function DecompressObj($num) {
    $pattern = "(?s)$num\s+0\s+obj.*?stream\r?\n(.*?)endstream"
    if ($str -match $pattern) {
        $m = [regex]::Match($str, $pattern)
        $raw = $m.Groups[1].Value
        $rawBytes = [System.Text.Encoding]::ASCII.GetBytes($raw)
        
        # find in $bytes exact position
        $pos = $m.Groups[1].Index
        $len = $m.Groups[1].Length
        $slice = New-Object byte[] ($len - 2)
        [Array]::Copy($bytes, $pos + 2, $slice, 0, $len - 2)
        
        $ms = New-Object System.IO.MemoryStream(,$slice)
        $ds = New-Object System.IO.Compression.DeflateStream($ms, [System.IO.Compression.CompressionMode]::Decompress)
        $sr = New-Object System.IO.StreamReader($ds, [System.Text.Encoding]::UTF8)
        return $sr.ReadToEnd()
    }
    return "NOT FOUND"
}

Write-Output "=== OBJ 17 (X5) ==="
Write-Output (DecompressObj 17)

Write-Output "=== OBJ 18 (X7) ==="
Write-Output (DecompressObj 18)
