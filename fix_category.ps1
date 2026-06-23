$f = "C:\Users\direc\Desktop\Claude Files\OnlySport\incaltaminte-barbati.html"
$c = [System.IO.File]::ReadAllText($f, [System.Text.Encoding]::UTF8)

# === 1. DIACRITICE — ordine importanta: multi-char inainte de single-char ===

# Uppercase combos first
$c = $c.Replace("ĂŽ", "Î")
$c = $c.Replace("Ă®", "î")
$c = $c.Replace("Ă˘", "â")
$c = $c.Replace("Ä‚", "Ă")
$c = $c.Replace("Čš", "Ț")

# Lowercase combos
$c = $c.Replace("Č›", "ț")
$c = $c.Replace("Č™", "ș")

# Single char — last
$c = $c.Replace("Ä", "ă")

# Punctuation / symbols
$c = $c.Replace("â€"", "—")
$c = $c.Replace("â€"", "–")
$c = $c.Replace("â€ş", "›")
$c = $c.Replace("â€¦", "…")
$c = $c.Replace("â†'", "→")
$c = $c.Replace("â†"", "←")

# === 2. CULOARE ACCENT: cyan → red-orange ===
$c = $c.Replace("--accent:  #00C7C9;", "--accent:  #FF4B33;")
$c = $c.Replace("--accent: #00C7C9;", "--accent: #FF4B33;")
$c = $c.Replace("#00C7C9", "#FF4B33")

# === 3. LOGO: inlocuieste img cu text simplu ===
$c = $c.Replace(
    '<img src="16.png" alt="OnlySport" style="height: 60px; width: auto; display: block;" />',
    'ONLYSPORT'
)

# Fix logo <a> style to match homepage
$c = $c.Replace(
    '<a href="#" class="logo">',
    '<a href="#" class="logo" style="font-size: 22px; font-weight: 900; letter-spacing: .08em; text-transform: uppercase; color: var(--black);">'
)

# === 4. TITLE TAG ===
$c = $c.Replace(
    "ĂŽncÄlČ›Äminte pentru BÄrbaČ›i | OnlySport",
    "Încălțăminte pentru Bărbați | OnlySport"
)

[System.IO.File]::WriteAllText($f, $c, [System.Text.Encoding]::UTF8)
Write-Host "Done."
