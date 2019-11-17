# XMS-Updater

This script is desinged to check for a newer version for the XMS Suite of programs from Aquaveo (who I used to work for), and automatically create a new package if their is a newer version released.

---
## FindVersions

This fucntion is designed to pull the necessary information from the Aquaveo website and the Chocolatey repository to figure out if a package needs to be updated or not. The 'CompareVersion' function is a small function that returns either true or false depending on if the versions match. From there, it enters an if/else. If true (the versions don't match), update (Call the UpdatePackage function), else do nothing.

## Update Package

This function uses BitsTransfer to download the new version of the software. BitsTransfer is significanty faster than other built-in Powershell tools for downloading a large online file that I could find.

When the file is downloaded, it will be hashed. Once hashed, the file will be deleted. 

Next, the appropriate folders will be made so when we generate files, they can be placed in the right spot. 

From there, this function will call both 'NuspecFile' and 'ChocolateyInstallFile' functions to make the two files needed.

Once that is done, we will change directories again and create the package using the 'cpack' command.

## NuspecFile

This function is an if/if else/else statement. Within each, the right Nuspec file will be made with the proper tags, including the right version number. One done, the file is created and the function returned. 

## ChocolateyInstallFile

This function creates the ChocolateyInstall File. It's basic, but once done, the file is created and the function returns. 

---
### Things to work on

-Make it so it also pushes the newly created packages (I don't do this yet since I want to make sure the packages are made without error).
