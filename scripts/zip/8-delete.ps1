#Deletes all the .zip files in the zip directory
Get-ChildItem -Path "zip" -Include *.zip -File -Recurse | foreach { $_.Delete()}
exit
