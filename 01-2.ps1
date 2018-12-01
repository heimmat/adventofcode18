$input = Get-Content .\01-1.input
$freqs = @{}
$latestFreq = 0
$i = 0
while ($freqs[$latestFreq] -lt 2) {
    $i = $i % $input.Count
    $latestFreq += $input[$i]
    $freqs[$latestFreq] += 1
    $i++
}
Write-Host $latestFreq