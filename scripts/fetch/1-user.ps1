# Define paths
$orphanFolder = "wip"
$loginFile = "Login-Credentials.txt"
$exePath = "C:\Program Files\Grabber\Grabber.com"

# Get credentials
$lines = Get-Content $loginFile
$username = $lines[1]  # Second line
$password = $lines[2]  # Third line

#Remove non-allowed files
$imageExtensions = @(".png", ".jpg", ".jpeg", ".webp", ".bmp")
$allFiles = Get-ChildItem -Path $orphanFolder -File
foreach ($file in $allFiles) {
    if ($imageExtensions -notcontains $file.Extension.ToLower()) {
        Remove-Item -Path $file.FullName -Force
    }
}

# Get the ID for each image and get it's tags
$imageFiles = Get-ChildItem -Path $orphanFolder -File | Where-Object {
    $imageExtensions -contains $_.Extension.ToLower()
}
foreach ($image in $imageFiles) {
    Write-Host "Getting tags for #$($image.BaseName)"
    $baseName = $image.BaseName
    $outputFile = Join-Path $orphanFolder "$baseName.txt"
    $arguments = @("-s", "e621.net", "-u", "$username", "-w", "$password", "-t", "id:$baseName", "--ri", "-m", "1", "-j")
    Start-Process -FilePath $exePath `
                  -ArgumentList $arguments `
                  -RedirectStandardOutput $outputFile `
                  -NoNewWindow `
                  -Wait
}
exit
