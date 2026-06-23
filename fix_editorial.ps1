$file = "C:\Users\direc\Desktop\Claude Files\OnlySport\index-orange.html"
$content = [System.IO.File]::ReadAllText($file, [System.Text.Encoding]::UTF8)
$lines = $content -split "`n"

$cutStart = -1
$cutEnd = -1

for ($i = 695; $i -lt 715; $i++) {
    if ($lines[$i] -match "EDITORIAL SPOTLIGHT" -and $lines[$i].StartsWith("<!--")) {
        $cutStart = $i
        Write-Host "cutStart at line $($i+1)"
        break
    }
}

for ($i = 730; $i -lt $lines.Count; $i++) {
    if ($lines[$i] -match "BRAND PHILOSOPHY" -and $lines[$i].StartsWith("<!--")) {
        $cutEnd = $i
        Write-Host "cutEnd at line $($i+1)"
        break
    }
}

if ($cutStart -ge 0 -and $cutEnd -gt $cutStart) {
    $newLines = $lines[0..($cutStart-1)] + $lines[$cutEnd..($lines.Count-1)]
    $newContent = $newLines -join "`n"
    [System.IO.File]::WriteAllText($file, $newContent, [System.Text.Encoding]::UTF8)
    Write-Host "Done. Removed $($cutEnd - $cutStart) lines."
} else {
    Write-Host "ERROR cutStart=$cutStart cutEnd=$cutEnd"
}
