# Define paths
$folderPath = "wip"

# Get all .txt files in the directory, apply append
$txtFiles = Get-ChildItem -Path $folderPath -Filter *.txt
foreach ($file in $txtFiles) {
    $content = Get-Content $file.FullName
    $updatedContent = $content + ", "
    Set-Content $file.FullName -Value $updatedContent
}
exit
