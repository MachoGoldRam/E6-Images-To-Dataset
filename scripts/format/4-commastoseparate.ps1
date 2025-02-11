# Define paths
$folderPath = "wip"

# Get all .txt files in the directory, apply replacements on each file
$txtFiles = Get-ChildItem -Path $folderPath -Filter *.txt
foreach ($file in $txtFiles) {
    $content = Get-Content $file.FullName
    $updatedContent = $content -replace " ", ", "
    Set-Content $file.FullName -Value $updatedContent
}
exit
