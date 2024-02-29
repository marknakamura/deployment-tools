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

## Settings
#### Configuring the WiFi
Output is in cleartext, XML will not be posted.
Use these commands to generate the XML config and use in the ISO:
```
netsh wlan show profiles
netsh wlan export profile WiFiNetworkName key=clear folder=.
```
