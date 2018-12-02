$input = Get-Content .\02-1.input

function countDifferentChars([String]$string1, [String]$string2) {
    $count = 0
    if ($string1.Length -ne $string2.Length) {
        return -1
    }
    else {
        for ($i = 0; $i -lt $string1.Length; $i++) {
            if ($string1[$i] -ne $string2[$i]) {
                $count++
            }
        }
        return $count
    }
}

function findSameChars([String]$string1, [string]$string2) {
    $retString = ""
    if ($string1.Length -ne $string2.Length) {
        return -1
    }
    else {
        for ($i = 0; $i -lt $string1.Length; $i++) {
            if ($string1[$i] -eq $string2[$i]) {
                $retString += $string1[$i]
            }
        }
        return $retString
    }
}


for ($i = 0; $i -lt $input.Count; $i++) {
    for ($j = $i+1; $j -lt $input.Count; $j++) {
       $diffs = countDifferentChars $input[$i] $input[$j]
       if ($diffs -eq 1) {

            Write-Host $(findSameChars $input[$i] $input[$j])
        }
    }
}

