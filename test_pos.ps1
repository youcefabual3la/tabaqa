Add-Type -AssemblyName PresentationCore, PresentationFramework, WindowsBase

# Transform for 'T' inside box (X5):
# Page position of box: X0=1866.2175, Y0=1514.56177, scale = 0.9907704
# X5 position: X=1957, Y=1583
# Relative to box origin:
# dx = (1957 - 1866.2175) / 0.9907704 = 91.628
# dy = (1583 - 1514.56177) / 0.9907704 = 69.076
# Inside X5:
# cm = [.55581933 0 0 .55581933 -61.826782 -30.238892]
# BT:
# Tf = 330.39001
# Tm = [1 0 0 -1 112.15625 339]

# Total transform on glyph points (which are in 1/1000 em or em):
# Let's compute where point (0,0) and (1,1) land:
function X5_Transform($gx, $gy) {
    # Text space: gx, gy are scaled by Tf/1000 = 0.33039
    # In PDF, glyph coordinate 1000 em:
    # x_t = gx * 0.33039
    # y_t = gy * 0.33039
    # Tm: x_m = x_t + 112.15625; y_m = -y_t + 339
    # cm: x_c = x_m * 0.55581933 - 61.826782; y_c = y_m * 0.55581933 - 30.238892
    # In page: x_p = 1957 + x_c; y_p = 1583 + y_c
    # In box coords (origin 1866.22, scale 0.99077):
    # x_b = (x_p - 1866.2175) / 0.9907704
    # y_b = (y_p - 1514.56177) / 0.9907704
    
    $xt = $gx * 0.33039001
    $yt = $gy * 0.33039001
    $xm = $xt + 112.15625
    $ym = -$yt + 339
    $xc = $xm * 0.55581933 - 61.826782
    $yc = $ym * 0.55581933 - 30.238892
    $xp = 1957 + $xc
    $yp = 1583 + $yc
    $xb = ($xp - 1866.2175) / 0.9907704
    $yb = ($yp - 1514.56177) / 0.9907704
    return @($xb, $yb)
}

# The 'T' in 1000-em coords:
# ST-Tokyo:
# M 50,-700 L 785,-700 L 785,-349 L 605,-349 L 605,-520 L 508,-520 L 508,0 L 328,0 L 328,-520 L 230,-520 L 230,-289 L 50,-289 Z
# Note in font space baseline is 0, top of T is at y=700 (or -700 depending on sign).
# In PDF text space, positive Y is UP. So top of T is +700, baseline is 0.
$top_left = X5_Transform 50 700
$bottom_right = X5_Transform 785 0

Write-Output "Box Inner square: X in [87.8, 362.4], Y in [87.8, 362.4]"
Write-Output "Box 'T' Top-Left in box coords: $($top_left[0]), $($top_left[1])"
Write-Output "Box 'T' Bottom-Right in box coords: $($bottom_right[0]), $($bottom_right[1])"
