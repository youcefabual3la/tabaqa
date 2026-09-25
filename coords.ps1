# Exact matrices from PDF:
# Page: M_page = [0.24, 0, 0, -0.24, 0, 1507.92] (applied to everything)
#
# But relative to the page coordinates (before M_page):
# Box:
# M_clip = [1928.34, 1576.68]
# M_box = [.99077, 0, 0, .99077, 1866.22, 1514.56]
# A point (x, y) in box coords -> (1866.22 + 0.99077 * x, 1514.56 + 0.99077 * y)
#
# For box outer:
# (62.7, 62.7) -> X = 1866.22 + 0.99077 * 62.7 = 1928.34
#              -> Y = 1514.56 + 0.99077 * 62.7 = 1576.68
# (437.3, 437.3) -> X = 1866.22 + 0.99077 * 437.3 = 2299.44
#                -> Y = 1514.56 + 0.99077 * 437.3 = 1947.83
# Width in page units = 371.1, Height = 371.15
#
# Box 'T' (X5):
# At [1957, 1583]
# Inside X5:
# cm = [.5558, 0, 0, .5558, -61.83, -30.24]
# Tm = [1, 0, 0, -1, 112.16, 339]
# Tf = 330.39
#
# Word 'T':
# At [2215.92, 1542.05] * 3.125 = ? wait:
# Stream 4: 3.125 0 0 3.125 2215.9243 1542.05481 cm
# Inside: Tf 102.13, Tm = [1, 0, 0, -1, 32.8, 104]
#
# Word 'ABAQA' (X7):
# At [2555, 1574]
# cm = [8.885, 0, 0, 8.885, -1216.47, -35.43]
# Tm = [1, 0, 0, -1, 137.7, 37]
# Tf = 36.08

# Let's write a script to evaluate the exact bounds and generate SVG!
Write-Output "Box bounds in page coords: 1928.34 to 2299.44 (width 371.1)"
