$input = Get-Content .\01-1.input
$freq = 0
for ($i=0; $i -lt $input.Count; $i++) {
    $freq += $input[$i]
}
Write-Host $freq