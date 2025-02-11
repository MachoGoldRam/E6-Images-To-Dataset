#### EXECUTION
#Tell user
Write-Host 'EXECUTION STARTED - BYPASSED WARNINGS'

# Image dump from zip files
Write-Host 'Extracting image files'
& ".\scripts\zip\0-unpack.ps1"

# Get with or without login
Write-Host 'Fetching tags'
if ($args[0] -eq "YES") {
    & ".\scripts\fetch\1-user.ps1"
} else {
    & ".\scripts\fetch\1-guest.ps1"
}

# Initial format for all text files
Write-Host 'Formatting tags'
& ".\scripts\format\2-initial.ps1"

# Backslash brackets
if ($args[1] -eq "YES") {
    & ".\scripts\format\3-backslashbrackets.ps1"
} else {}

# Separate with commas
if ($args[3] -eq "YES") {
    & ".\scripts\format\4-commastoseparate.ps1"
} else {}

# Underscores to spaces
if ($args[2] -eq "YES") {
    & ".\scripts\format\5-underscoretospace.ps1"
} else {}

# Separate last with comma space
if ($args[4] -eq "YES") {
    & ".\scripts\format\6-separatelast.ps1"
} else {}

# Repetitions, concept name, activation token to prepend
Write-Host 'Applying activation token and naming folder'
& ".\scripts\format\7-activationtoken.ps1" "$($args[7])"
& ".\scripts\zip\9-consolidatefolder.ps1" "$($args[5])" "$($args[6])"

if ($args[8] -eq "YES") {
Write-Host 'Cleaning ZIP file/s'
    & ".\scripts\zip\8-delete.ps1"
} else {}

#Tell user
Write-Host 'Dataset ready'
Write-Host 'Press any key to exit';
[void][System.Console]::ReadKey($FALSE)

exit
