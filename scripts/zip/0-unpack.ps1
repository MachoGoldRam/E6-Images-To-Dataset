#Eztracts all the .zip files in the zip directory into the wip folder
Get-ChildItem -Path "zip" -Filter "*.zip" | ForEach-Object {
    Expand-Archive -Path $_.FullName -DestinationPath ".\wip" -Force
}
exit
