# Define paths
$orphanFolder = "wip"
$exePath = "C:\Program Files\Grabber\Grabber.com"

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
    $baseName = $image.BaseName
    $outputFile = Join-Path $orphanFolder "$baseName.txt"
    $arguments = @("-s", "e621.net", "-t", "id:$baseName", "--ri", "-m", "1", "-j")
    Start-Process -FilePath $exePath `
                  -ArgumentList $arguments `
                  -RedirectStandardOutput $outputFile `
                  -NoNewWindow `
                  -Wait
}
exit
