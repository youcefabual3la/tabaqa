[Windows.Storage.StorageFile, Windows.Storage, ContentType = WindowsRuntime] | Out-Null
[Windows.Data.Pdf.PdfDocument, Windows.Data.Pdf, ContentType = WindowsRuntime] | Out-Null

$pdfFile = [Windows.Storage.StorageFile]::GetFileFromPathAsync('C:\Users\Specialist\.gemini\antigravity\brain\b4687551-b8ea-43e5-8735-75323e41c3af\.user_uploaded\media_1790369850693.pdf').GetAwaiter().GetResult()
$doc = [Windows.Data.Pdf.PdfDocument]::LoadFromFileAsync($pdfFile).GetAwaiter().GetResult()
$page = $doc.GetPage(0)

Write-Output "PDF Page Size: $($page.Size.Width) x $($page.Size.Height)"
