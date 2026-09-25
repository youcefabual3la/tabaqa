Add-Type -AssemblyName PresentationCore, PresentationFramework, WindowsBase

# Load fonts
$gtST = New-Object System.Windows.Media.GlyphTypeface(New-Object System.Uri('d:\tabaqa\assets\STTokyo.ttf'))
$gtLilita = New-Object System.Windows.Media.GlyphTypeface(New-Object System.Uri('d:\tabaqa\assets\LilitaOne.ttf'))

# Path for 'T' (STTokyo) at 100pt:
$gidT = $gtST.CharacterToGlyphMap[[int][char]'T']
$geoT = $gtST.GetGlyphOutline($gidT, 100, 100)
Write-Output "T path: $($geoT.ToString())"

# Path for 'A', 'B', 'Q' (LilitaOne) at 100pt:
$gidA = $gtLilita.CharacterToGlyphMap[[int][char]'A']
$geoA = $gtLilita.GetGlyphOutline($gidA, 100, 100)

$gidB = $gtLilita.CharacterToGlyphMap[[int][char]'B']
$geoB = $gtLilita.GetGlyphOutline($gidB, 100, 100)

$gidQ = $gtLilita.CharacterToGlyphMap[[int][char]'Q']
$geoQ = $gtLilita.GetGlyphOutline($gidQ, 100, 100)

# In Stream 4:
# Page transform: .24 0 0 -.24 0 1507.92
# Mark box transform: .99077 0 0 .99077 1866.22 1514.56
# Inside box: coords 62.7 to 437.3
# Box 'T' transform: .5558 0 0 .5558 -61.83 -30.24, scale 330.39, Tm 112.16 339
# Word 'T' transform: 3.125 scale, at 2215.92, 1542.05, font size 102.13, Tm 32.8 104
# Word 'ABAQA' transform: at 2555 1574, scale 8.885, font size 36.08

# Let's inspect the exact visual bounds by rendering to a bitmap or SVG!
