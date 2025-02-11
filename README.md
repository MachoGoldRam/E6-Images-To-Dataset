# **Arcos' Dataset Formatter**

## PURPOSE
You pick the images with a few clicks on e621, download them in a .zip, configure the scripts, run, and your dataset comes out tagged and ready to train. All in less than 5 minutes! (Depending on the amount of images)
These are a series of scripts designed to work along with the RE621 TamperMonkey Script and the .com executable of a full Bionus' Image Board Grabber installaton.
Installation of all is detailed in the next step.

## INSTALLATION
**To use these scripts you will need the following:**
- Chromium-based browser that can run extensions and has developer mode available to be enabled.
- A full local install of Bionus ImgBrdGrabber.
- Windows, with PowerShell and CMD in your system (usually preinstalled)

**Steps:**
- In your browser, install the TamperMonkey Extension from [the chrome web store](https://chromewebstore.google.com/detail/tampermonkey/dhdgffkkebhmkfjojejmpbldmpobfkfo) and follow it's [install instructions](https://www.tampermonkey.net/faq.php?locale=en#Q100).
- Add [RE621](https://re621.app/) to tampermonkey clicking the install button and make sure to and have it enabled.
- Go to [e621.net](https://e621.net/) and configure RE621 as follows:
- Click the configuration icon on the top-left section of the header.

![plot](./images/SettingsIcon.png?raw=true)


- On the "Downloads" tab, expand the "Mass downloader" section and set the "Image file name" field as "%postid%".
![plot](./images/DownloadSettings.png?raw=true)


- Install [ImgBrdGrabber](https://www.bionus.org/imgbrd-grabber/docs/install/windows.html) via the installer on it's default install path. Close after installing.
- Download this repository into a designed folder of your choice.


## USAGE
Perform a search of the images you want to train on.
Then, on the bottom of the left sidebar, under the "Download" section, click "Select".

![plot](./images/WhereDownload.png?raw=true)

Click on the tumbnails of the images you want to add to your dataset. A download icon will appear on the top left of the thumbnails.

![plot](./images/SelectedToDownload.png?raw=true)

Click download when you are satisfied with your selection, then wait for your collection to compress into the zipped archive.

![plot](./images/DownloadAction.png?raw=true)

Download the file to the `zip` folder on the root of this project.

![plot](./images/SaveAs.png?raw=true)

You can download multiple collections of pictures for the same concept.

Run the script double-clicking the `.BAT` - To have the script behave with your preferences, specify the values for each of these as arguments inside the `.BAT` file:

| # | NAME | FORMAT | ACTION |
| ------ | ------ | ------ | ------ |
| 1 | Use Log in | boolean | Switch between using the login in the .txt file and public access as a guest when fetching tag data. To use this option, place your username and password/api-key on the second and third line respectively inside "Login-Credentials.txt".|
| 2 | Backslash brackets | boolean | Turns "\(" into "\\\(" and turns "\)" into "\\\)".|
| 3 | Underscores to space | boolean | Turns "_" into " ".
| 4 | Separate with commas | boolean | Turns "tag1 tag2" into "tag1, tag2".|
| 5 | Separate last | boolean | Adds a ', ' after the last tag.|
| 6 | Repetitions | integer | The number of repetitions for the concept, usually 1: Folder name will be '\[repetitions\]_\[concept name\]'.|
| 7 | Concept name | string | The concept name to train on, as a single lowercase word: Folder name will be '\[repetitions\]_\[concept name\]'.|
| 8 | Activation token/s | string | The single lowercase word to prepend to the per-image .txt caption tag file, working as a trigger for manifestation. Format it the same way as the rest of the tags.|
| 9 | Delete source | boolean | Deletes the origin .ZIP file/s after running.|

_FORMAT REFERENCE_
- Boolean: 'YES' OR 'NO'
- Integer: ANY OF '123456789'
- String:  ANY OF 'abcdefghijklmnopqrstuvwxyz'

#### EXAMPLE
For: Do log in, not backslash the brackets, do turn the underscores into spaces, do separate with commas, do separate last, 1 repetition, concept name "beluga", activation token/s "beluga, ", do delete source zip file/s.
Command on the fourth line of "`TOOL.BAT` would be:

> `powershell -ExecutionPolicy Bypass -File .\scripts\general.ps1 YES NO YES YES YES 1 "beluga" "beluga, " YES`

This is also the recommended way to run and format.
Upon execution, the script will tell you what it's going to do. To not get prompted with these warnings, in the command, replace "`general.ps1`" with "`general-nowarn.ps1`".
To always use a specific configuration, copy "EXAMPLE.BAT" with a different name and change the fourth line of your copy to your command.
