# Define paths
$folderPath = "wip"

# Get all .txt files in the directory, apply prepend
$txtFiles = Get-ChildItem -Path $folderPath -Filter *.txt
foreach ($file in $txtFiles) {
    $content = Get-Content $file.FullName
    $updatedContent = $($args[0]) + $content
    Set-Content $file.FullName -Value $updatedContent
}
exit
