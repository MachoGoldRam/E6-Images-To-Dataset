# Define paths
$folderPath = "wip"

# Get all .txt files in the directory, Read the JSON format, make a storage list, concatenate
$txtFiles = Get-ChildItem -Path $folderPath -Filter "*.txt" -File
foreach ($file in $txtFiles) {
    $jsonContent = Get-Content -Path $file.FullName -Raw | ConvertFrom-Json
    $extractedTags = @()
    $categories = @("artist", "copyright", "species", "general", "lore")

    foreach ($category in $categories) {
        if ($jsonContent[0].PSObject.Properties.Name -contains $category) {
            $extractedTags += $jsonContent[0].$category
        }
    }
    $formattedTags = ($extractedTags -join " ")
    Set-Content -Path $file.FullName -Value $formattedTags -Encoding UTF8
}
exit
