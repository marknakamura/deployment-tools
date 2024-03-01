# A repository to help with setting up Windows images.

## References
### Windows 10 ISO
https://www.microsoft.com/en-us/software-download/windows10

### Windows 11 ISO
https://www.microsoft.com/software-download/windows11

### NTLite
https://www.ntlite.com/

### Chocolatey
https://community.chocolatey.org/

### Sysinternals
https://learn.microsoft.com/en-us/sysinternals/

### BGInfo Useful Strings
https://slwhitewv.blogspot.com/2012/11/bginfo-useful-custom-strings.html

## Settings
#### Configuring the WiFi
1. Output is in cleartext, XML will not be posted.
2. Use these commands to generate the XML config and use in the ISO:
```
netsh wlan show profiles
netsh wlan export profile WiFiNetworkName key=clear folder=.
```
3. Add the XML as a file in the Post-Setup
4. Use this command in the Post-Setup
`netsh wlan add profile filename="%WINDIR%\Setup\Files\WiFiNetworkName.xml" user=all`
5. Ensure the WLANAutoconfig service is enabled

###  Setting the wallpaper
After loading the ISO in NTLite to edit:
1. Right click the Loaded image and select "Explore mount directory"
![image](https://github.com/marknakamura/deployment-tools/assets/57322698/7148fbb4-bd4a-4d46-a362-327d51bb3ee6)
2. Navigate to Windows\Web\Wallpaper (this is mounted as a temp folder in your host's File Explorer; full path is: C:\Users\XXXXXXX\AppData\Local\Temp\NLTmpMnt\Windows\Web\Wallpaper)
![image](https://github.com/marknakamura/deployment-tools/assets/57322698/81c5ddc1-d451-4a1c-a1ce-713baea563f7)
3. Delete the existing "img0.jpg" file - you may have to take change permissions on the file to be able to delete it
4. Rename your desired image file to "img0.jpg" and put in this directory (if this doesn't seem to work, add it to the "Windows 10" folder as well)
5. Close the File Explorer
6. Navigate to the "Remove\Components" section
7. Expand the menu for "Multimedia"
8. Scroll down and ensure that the boxes are checked for "Wallpaper (Default)" & "Wallpapers (Themes)
9. ![image](https://github.com/marknakamura/deployment-tools/assets/57322698/34eef0cf-2aa6-430e-ab8e-4aaa9b8aeffe)

