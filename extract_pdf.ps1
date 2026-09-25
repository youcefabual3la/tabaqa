Add-Type -AssemblyName System.IO.Compression.FileSystem

function Decompress-PdfStreams($pdfPath, $outPath) {
    $bytes = [System.IO.File]::ReadAllBytes($pdfPath)
    $streamStr = [System.Text.Encoding]::ASCII.GetString($bytes)
    
    $regex = [regex]'(?s)stream\r?\n(.*?)endstream'
    $matches = $regex.Matches($streamStr)
    
    $results = @()
    $idx = 0
    foreach ($m in $matches) {
        $start = $m.Groups[1].Index
        $length = $m.Groups[1].Length
        
        # In byte array, get the exact slice
        # Notice zlib header is 2 bytes (usually 0x78 0x9c or 0x78 0xda)
        # Skip 2 bytes for DeflateStream
        try {
            $streamBytes = New-Object byte[] ($length - 2)
            [Array]::Copy($bytes, $start + 2, $streamBytes, 0, $length - 2)
            
            $ms = New-Object System.IO.MemoryStream(,$streamBytes)
            $ds = New-Object System.IO.Compression.DeflateStream($ms, [System.IO.Compression.CompressionMode]::Decompress)
            $sr = New-Object System.IO.StreamReader($ds, [System.Text.Encoding]::UTF8)
            $decompressed = $sr.ReadToEnd()
            $results += "--- STREAM $idx ---`n" + $decompressed
        } catch {
            # maybe not zlib or failed
            $results += "--- STREAM $idx (RAW) ---`n"
        }
        $idx++
    }
    Set-Content -Path $outPath -Value ($results -join "`n`n")
}

Decompress-PdfStreams 'C:\Users\Specialist\.gemini\antigravity\brain\b4687551-b8ea-43e5-8735-75323e41c3af\.user_uploaded\media_1790369850693.pdf' 'd:\tabaqa\full_logo_stream.txt'
Decompress-PdfStreams 'C:\Users\Specialist\.gemini\antigravity\brain\b4687551-b8ea-43e5-8735-75323e41c3af\.user_uploaded\media_1790369917389.pdf' 'd:\tabaqa\mark_stream.txt'
Write-Output "Extracted successfully"
