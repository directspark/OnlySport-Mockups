$file = "C:\Users\direc\Desktop\Claude Files\OnlySport\index.html"
$content = [System.IO.File]::ReadAllText($file, [System.Text.Encoding]::UTF8)

# Only process within the <style> block
$styleStart = $content.IndexOf("<style>")
$styleEnd = $content.IndexOf("</style>")
$before = $content.Substring(0, $styleStart)
$css = $content.Substring($styleStart, $styleEnd - $styleStart)
$after = $content.Substring($styleEnd)

# Increase font sizes under 15px by 2px
# Match font-size: Xpx or font-size: X.Xpx
$css = [regex]::Replace($css, 'font-size:\s*8px', 'font-size: 10px')
$css = [regex]::Replace($css, 'font-size:\s*9px', 'font-size: 11px')
$css = [regex]::Replace($css, 'font-size:\s*10px', 'font-size: 12px')
$css = [regex]::Replace($css, 'font-size:\s*11px', 'font-size: 13px')
$css = [regex]::Replace($css, 'font-size:\s*11\.5px', 'font-size: 13.5px')
$css = [regex]::Replace($css, 'font-size:\s*12px', 'font-size: 14px')
$css = [regex]::Replace($css, 'font-size:\s*12\.5px', 'font-size: 14.5px')
$css = [regex]::Replace($css, 'font-size:\s*13px', 'font-size: 15px')
$css = [regex]::Replace($css, 'font-size:\s*13\.5px', 'font-size: 15.5px')

[System.IO.File]::WriteAllText($file, ($before + $css + $after), [System.Text.Encoding]::UTF8)
Write-Host "Done."
