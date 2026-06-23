$file = "C:\Users\direc\Desktop\Claude Files\OnlySport\15.svg"
$content = [System.IO.File]::ReadAllText($file, [System.Text.Encoding]::UTF8)
$pattern = '<path d="M0 0 C914\.1 0 1828\.2 0 2770 0 C2770 496\.32 2770 992\.64 2770 1504 C1855\.9 1504 941\.8 1504 0 1504 C0 1007\.68 0 511\.36 0 0 Z " fill="#E4E5E4" transform="translate\(0,0\)"/>'
$cleaned = [regex]::Replace($content, $pattern, "")
[System.IO.File]::WriteAllText($file, $cleaned, [System.Text.Encoding]::UTF8)
Write-Host "Chars removed: $(($content.Length - $cleaned.Length))"
