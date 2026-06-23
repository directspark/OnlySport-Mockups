$file = "C:\Users\direc\Desktop\Claude Files\OnlySport\index-orange.html"
$content = [System.IO.File]::ReadAllText($file, [System.Text.Encoding]::UTF8)

$newSection = "<!-- COLLECTOR_SECTION_START -->`n<div class=`"collector-section`">`n  <div class=`"collector-inner`">`n    <div class=`"collector-header`">`n      <span class=`"section-eyebrow`">Piese de colectie</span>`n      <h2 class=`"section-title`" style=`"color:var(--white);`">Pentru cei care stiu.<br><span style=`"color:var(--accent);`">Colectia de raritati.</span></h2>`n      <p class=`"section-sub`" style=`"color:rgba(255,255,255,.45);`">Peste 100 de piese unicat &mdash; modele vechi, tiraje originale, unele purtate o singura data sau deloc. Nu le cumperi ca sa le porti. Le cumperi ca sa le ai.</p>`n    </div>`n    <div class=`"collector-grid`">`n`n      <div class=`"collector-card`">`n        <div class=`"collector-img-wrap`">`n          <img src=`"13.webp`" alt=`"Air Jordan 1 High OG Chicago`" />`n          <div class=`"collector-img-overlay`"></div>`n        </div>`n        <div class=`"collector-body`">`n          <span class=`"collector-badge`">Collector Piece</span>`n          <div class=`"collector-brand`">Nike / Jordan Brand</div>`n          <div class=`"collector-name`">Air Jordan 1 High OG &bdquo;Chicago&rdquo;</div>`n          <div class=`"collector-year`">1985 Original Release &mdash; DS</div>`n          <button class=`"collector-cta`">Solicita oferta <svg width=`"14`" height=`"14`" fill=`"none`" viewBox=`"0 0 24 24`" stroke=`"currentColor`" stroke-width=`"2.5`"><path d=`"M5 12h14M12 5l7 7-7 7`"/></svg></button>`n        </div>`n      </div>`n`n      <div class=`"collector-card`">`n        <div class=`"collector-img-wrap`">`n          <img src=`"12.png`" alt=`"Nike Air Max 1 Safari`" />`n          <div class=`"collector-img-overlay`"></div>`n        </div>`n        <div class=`"collector-body`">`n          <span class=`"collector-badge`">Collector Piece</span>`n          <div class=`"collector-brand`">Nike</div>`n          <div class=`"collector-name`">Nike Air Max 1 &bdquo;Safari&rdquo;</div>`n          <div class=`"collector-year`">1987 OG &mdash; VNDS</div>`n          <button class=`"collector-cta`">Solicita oferta <svg width=`"14`" height=`"14`" fill=`"none`" viewBox=`"0 0 24 24`" stroke=`"currentColor`" stroke-width=`"2.5`"><path d=`"M5 12h14M12 5l7 7-7 7`"/></svg></button>`n        </div>`n      </div>`n`n      <div class=`"collector-card`">`n        <div class=`"collector-img-wrap`">`n          <img src=`"2.png`" alt=`"Nike Dunk High Kentucky`" />`n          <div class=`"collector-img-overlay`"></div>`n        </div>`n        <div class=`"collector-body`">`n          <span class=`"collector-badge`">Collector Piece</span>`n          <div class=`"collector-brand`">Nike</div>`n          <div class=`"collector-name`">Nike Dunk High &bdquo;Kentucky&rdquo;</div>`n          <div class=`"collector-year`">2003 PE &mdash; DS</div>`n          <button class=`"collector-cta`">Solicita oferta <svg width=`"14`" height=`"14`" fill=`"none`" viewBox=`"0 0 24 24`" stroke=`"currentColor`" stroke-width=`"2.5`"><path d=`"M5 12h14M12 5l7 7-7 7`"/></svg></button>`n        </div>`n      </div>`n`n      <div class=`"collector-card`">`n        <div class=`"collector-img-wrap`">`n          <img src=`"11.png`" alt=`"Air Jordan 4 Fire Red`" />`n          <div class=`"collector-img-overlay`"></div>`n        </div>`n        <div class=`"collector-body`">`n          <span class=`"collector-badge`">Collector Piece</span>`n          <div class=`"collector-brand`">Nike / Jordan Brand</div>`n          <div class=`"collector-name`">Air Jordan 4 &bdquo;Fire Red&rdquo;</div>`n          <div class=`"collector-year`">1989 OG &mdash; VNDS</div>`n          <button class=`"collector-cta`">Solicita oferta <svg width=`"14`" height=`"14`" fill=`"none`" viewBox=`"0 0 24 24`" stroke=`"currentColor`" stroke-width=`"2.5`"><path d=`"M5 12h14M12 5l7 7-7 7`"/></svg></button>`n        </div>`n      </div>`n`n    </div>`n    <a href=`"#`" class=`"collector-footer-link`">`n      Vezi intreaga colectie de raritati`n      <svg width=`"14`" height=`"14`" fill=`"none`" viewBox=`"0 0 24 24`" stroke=`"currentColor`" stroke-width=`"2.5`"><path d=`"M5 12h14M12 5l7 7-7 7`"/></svg>`n    </a>`n  </div>`n</div>`n`n"

# Use IndexOf with simple ASCII markers
$startMarker = "SCOUTED PICKS"
$endMarker = "EDITORIAL SPOTLIGHT"

$startIdx = $content.IndexOf($startMarker)
$endIdx = $content.IndexOf($endMarker)

# Walk back to find the start of the comment line
while ($startIdx -gt 0 -and $content[$startIdx-1] -ne "`n") { $startIdx-- }

# Walk back to find the start of the comment line for end
while ($endIdx -gt 0 -and $content[$endIdx-1] -ne "`n") { $endIdx-- }

if ($startIdx -ge 0 -and $endIdx -ge 0) {
    $before = $content.Substring(0, $startIdx)
    $after = $content.Substring($endIdx)
    $newContent = $before + $newSection + $after
    [System.IO.File]::WriteAllText($file, $newContent, [System.Text.Encoding]::UTF8)
    Write-Host "Done. Replaced section successfully."
} else {
    Write-Host "ERROR: Could not find markers. Start=$startIdx, End=$endIdx"
}
