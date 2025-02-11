#### WARNING
Write-Host 'WARNING - UPON EXECUTION:'
Write-Host ' '
Write-Host '#################################################################'
# Get with or without login
if ($args[0] -eq "YES") {
    Write-Host 'Fetch the tags LOGGING IN'
} else {
    Write-Host 'Fetch the tags AS GUEST'
}

Write-Host 'For formatting:'
# Backslash brackets
if ($args[1] -eq "YES") {
    Write-Host 'DO BACKSLASH the brackets'
} else {
    Write-Host 'KEEP BRACKETS as original'
}

# Separate with commas
if ($args[3] -eq "YES") {
    Write-Host 'Separate tags with COMMA SPACE'
} else {
    Write-Host 'Separate tags with SPACE ONLY as original'
}

# Underscores to spaces
if ($args[2] -eq "YES") {
    Write-Host 'Turn the UNDERSCORE TO SPACES'
} else {
    Write-Host 'KEEP UNDERSCORES as original'
}

# Separate last with comma space
if ($args[4] -eq "YES") {
    Write-Host 'Append COMMA SPACE to LAST TAG'
} else {
    Write-Host 'NOT append COMMA SPACE to LAST TAG as original'
}

# Repetitions, concept name, activation token to prepend
Write-Host "Repetitions set to: $($args[5])"
Write-Host "Concept name is: $($args[6])"
Write-Host "ACTIVATION TOKEN IS: $($args[7])"
Write-Host "FOLDER NAME WILL BE: $($args[5])_$($args[6])"

if ($args[8] -eq "YES") {
    Write-Host 'Source ZIP file/s are set to be DELETED'
} else {
    Write-Host 'Source ZIP file/s are set to PERSIST'
}

Write-Host '#################################################################'
Write-Host ' '
Write-Host 'Press any key to confirm your settings and run'
[void][System.Console]::ReadKey($FALSE)

#################################################################


#### EXECUTION
#Tell user
Write-Host 'EXECUTION STARTED'

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
