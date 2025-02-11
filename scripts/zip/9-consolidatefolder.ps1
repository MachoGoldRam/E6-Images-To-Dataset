# Define paths
$orphanFolder = "wip"

# Define repetition number and dataset name
$repetitionNumber = $($args[0])
$datasetName = $($args[1])

# Construct the new folder name, rename to consolidate, and create new folder, tell user
$newFolderName = "${repetitionNumber}_${datasetName}"
Rename-Item -Path $orphanFolder -NewName $newFolderName
New-Item -Path $orphanFolder -ItemType Directory | Out-Null
exit
