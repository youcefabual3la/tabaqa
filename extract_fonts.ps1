$bytes = [System.IO.File]::ReadAllBytes('C:\Users\Specialist\.gemini\antigravity\brain\b4687551-b8ea-43e5-8735-75323e41c3af\.user_uploaded\media_1790369850693.pdf')
$str = [System.Text.Encoding]::ASCII.GetString($bytes)

function ExtractFont($num, $outPath) {
    $pattern = "(?s)$num\s+0\s+obj.*?stream\r?\n(.*?)endstream"
    if ($str -match $pattern) {
        $m = [regex]::Match($str, $pattern)
        $pos = $m.Groups[1].Index
        $len = $m.Groups[1].Length
        $slice = New-Object byte[] ($len - 2)
        [Array]::Copy($bytes, $pos + 2, $slice, 0, $len - 2)
        
        $ms = New-Object System.IO.MemoryStream(,$slice)
        $ds = New-Object System.IO.Compression.DeflateStream($ms, [System.IO.Compression.CompressionMode]::Decompress)
        $outMs = New-Object System.IO.MemoryStream
        $ds.CopyTo($outMs)
        [System.IO.File]::WriteAllBytes($outPath, $outMs.ToArray())
        Write-Output "Extracted $outPath ($($outMs.Length) bytes)"
    }
}

ExtractFont 45 'd:\tabaqa\assets\STTokyo.ttf'
ExtractFont 46 'd:\tabaqa\assets\LilitaOne.ttf'
