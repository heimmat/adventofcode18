$input = Get-Content .\02-1.input
$twos = 0
$threes = 0
for ($i = 0; $i -lt $input.Count; $i++) {
    $charCount = @{}
    $foundTwo = $false
    $foundThree = $false
    foreach ($char in $input[$i].ToCharArray()) {
        $charCount[$char]++
    }
    foreach ($char in $charCount.Keys) {
        
        if ($charCount[$char] -eq 2 -and -not $foundTwo) {
            $twos++
            $foundTwo = $true
        }
        if ($charCount[$char] -eq 3 -and -not $foundThree) {
            $threes++
            $foundThree = $true
        }
    }
    Write-Host "Zwei: $foundTwo, Drei: $foundThree" 
}
Write-Host "Zwei: $twos"
Write-Host "Drei: $threes"
Write-Host $($twos * $threes)

