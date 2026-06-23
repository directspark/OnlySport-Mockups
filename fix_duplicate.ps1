$file = "C:\Users\direc\Desktop\Claude Files\OnlySport\index-orange.html"
$content = [System.IO.File]::ReadAllText($file, [System.Text.Encoding]::UTF8)
$lines = $content -split "`n"

# Find line with raw CSS (starts with spaces + "/* ---")
$cutStart = -1
$cutEnd = -1

for ($i = 690; $i -lt 720; $i++) {
    if ($lines[$i].TrimStart().StartsWith("/*")) {
        $cutStart = $i
        Write-Host "cutStart at line $($i+1): $($lines[$i].Substring(0, [Math]::Min(50,$lines[$i].Length)))"
        break
    }
}

for ($i = 1450; $i -lt $lines.Count; $i++) {
    if ($lines[$i] -match "EDITORIAL SPOTLIGHT" -and $lines[$i].StartsWith("<!--")) {
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
