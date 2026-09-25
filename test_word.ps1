# Box in page coords:
# X min = 1928.34, X max = 2299.44 (Width = 371.1)
# Y min = 1576.68, Y max = 1947.83 (Height = 371.15)
# Center Y of box: 1576.68 + 371.15 / 2 = 1762.26

# Word 'T':
# Stream 4: 3.125 0 0 3.125 2215.9243 1542.05481 cm
# Tf = 102.13, Tm = [1 0 0 -1 32.8 104]
# In text space, font size 102.13:
# xt = gx * 0.10213, yt = gy * 0.10213
# xm = xt + 32.8, ym = -yt + 104
# xp = 2215.9243 + xm * 3.125
# yp = 1542.05481 + ym * 3.125

function WordT_Transform($gx, $gy) {
    $xt = $gx * 0.102129997
    $yt = $gy * 0.102129997
    $xm = $xt + 32.796875
    $ym = -$yt + 104
    $xp = 2215.9243 + $xm * 3.125
    $yp = 1542.05481 + $ym * 3.125
    return @($xp, $yp)
}

$wt_tl = WordT_Transform 50 700
$wt_br = WordT_Transform 785 0
Write-Output "Word 'T' Page X: $($wt_tl[0]) to $($wt_br[0]) (Width = $($wt_br[0] - $wt_tl[0]))"
Write-Output "Word 'T' Page Y: $($wt_tl[1]) to $($wt_br[1]) (Height = $($wt_br[1] - $wt_tl[1]))"

# Word 'ABAQA':
# At X7 (2555, 1574)
# cm = [8.8851776 0 0 8.8851776 -1216.46704 -35.434692]
# BT: Tf = 36.080002
# Tm = [1 0 0 -1 137.703125 37]
function WordABAQA_Transform($gx, $gy, $tdX) {
    $xt = $gx * 0.036080002
    $yt = $gy * 0.036080002
    $xm = $xt + 137.703125 + $tdX
    $ym = -$yt + 37
    $xc = $xm * 8.8851776 - 1216.46704
    $yc = $ym * 8.8851776 - 35.434692
    $xp = 2555 + $xc
    $yp = 1574 + $yc
    return @($xp, $yp)
}

$a1_tl = WordABAQA_Transform 0 700 0
$q_br = WordABAQA_Transform 700 0 (23.63 + 21.43 + 23.63 + 25.47)
$last_a_br = WordABAQA_Transform 655 0 (23.63 + 21.43 + 23.63 + 25.47 + 23.63)

Write-Output "Word 'ABAQA' start X: $($a1_tl[0]), end X: $($last_a_br[0])"
Write-Output "Word 'ABAQA' Y: $($a1_tl[1]) to $($last_a_br[1])"
