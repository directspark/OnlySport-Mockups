$f = "C:\Users\direc\Desktop\Claude Files\OnlySport\index-orange.html"
$c = [System.IO.File]::ReadAllText($f, [System.Text.Encoding]::UTF8)
$c = $c.Replace("Piese de colectie", "Grails &amp; Retros")
$c = $c.Replace("Pentru cei care stiu.", "Piese de colec&#x21B;ie.")
$c = $c.Replace("Colectia de raritati.", "Pentru adev&#x103;ra&#x21B;ii pasiona&#x21B;i.")
[System.IO.File]::WriteAllText($f, $c, [System.Text.Encoding]::UTF8)
Write-Host "Done."
