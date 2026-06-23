$f = "C:\Users\direc\Desktop\Claude Files\OnlySport\index-orange.html"
$c = [System.IO.File]::ReadAllText($f, [System.Text.Encoding]::UTF8)

# Fix HTML entities inserted by previous scripts
$c = $c.Replace("&#x21B;", [char]0x021B)   # ț
$c = $c.Replace("&#x103;", [char]0x0103)   # ă
$c = $c.Replace("&#x15F;", [char]0x015F)   # ş
$c = $c.Replace("&#xE2;",  [char]0x00E2)   # â
$c = $c.Replace("&#xEE;",  [char]0x00EE)   # î

# Collector section - words without diacritics
$c = $c.Replace("Grails &amp; Retros", "Grails &amp; Retros")
$c = $c.Replace("Piese de colec" + [char]0x021B + "ie.", "Piese de colec" + [char]0x021B + "ie.")
$c = $c.Replace("Pentru adev", "Pentru adev")  # already ok

# Specific missing diacritics in collector section
$c = $c.Replace("Pentru adev&#x103;ra&#x21B;ii pasiona&#x21B;i.", "Pentru adev" + [char]0x103 + "ra" + [char]0x21B + "ii pasiona" + [char]0x21B + "i.")
$c = $c.Replace("Solicita oferta", "Solicit" + [char]0x103 + " ofert" + [char]0x103)
$c = $c.Replace("Vezi intreaga colectie de raritati", "Vezi " + [char]0xEE + "ntreaga colec" + [char]0x21B + "ie de rarit" + [char]0x103 + [char]0x21B + "i")
$c = $c.Replace("Piese de colectie", "Piese de colec" + [char]0x21B + "ie")
$c = $c.Replace("Colectia de raritati", "Colec" + [char]0x21B + "ia de rarit" + [char]0x103 + [char]0x21B + "i")
$c = $c.Replace("Pentru cei care stiu", "Pentru cei care " + [char]0x15F + "tiu")
$c = $c.Replace("stiu.", [char]0x15F + "tiu.")
$c = $c.Replace("intreaga", [char]0xEE + "ntreaga")
$c = $c.Replace("Intreaga", [char]0xEE + "ntreaga")
$c = $c.Replace("sa le porti", "s" + [char]0x103 + " le por" + [char]0x21B + "i")
$c = $c.Replace("sa le ai", "s" + [char]0x103 + " le ai")
$c = $c.Replace("sa le cumperi", "s" + [char]0x103 + " le cumperi")
$c = $c.Replace("Nu le cumperi ca sa le porti. Le cumperi ca sa le ai.", "Nu le cumperi ca s" + [char]0x103 + " le por" + [char]0x21B + "i. Le cumperi ca s" + [char]0x103 + " le ai.")
$c = $c.Replace("unele purtate o singura data", "unele purtate o singur" + [char]0x103 + " dat" + [char]0x103)
$c = $c.Replace("modele vechi, tiraje originale", "modele vechi, tiraje originale")
$c = $c.Replace("Collector Piece", "Collector Piece")
$c = $c.Replace("COLLECTOR_SECTION_START", "COLLECTOR_SECTION_START")

# Common Romanian words often missing diacritics
$c = $c.Replace("magazin", "magazin")  # already ok, no diacritics needed
$c = $c.Replace("diacritice", "diacritice")

[System.IO.File]::WriteAllText($f, $c, [System.Text.Encoding]::UTF8)
Write-Host "Done."
