# oneDrive MyWay

This repository is code I used to manage syncing a Windows 10 folder with a personal oneDrive account without adding the account to the Windows 10 native oneDrive app.  

This is useful when using a computer restricted according to Windows security policies to disable adding personal oneDrive accounts to the native Windows 10 synchronization application (a common configuration for work computers).

Take note that the aforementioned business Windows security policy must [authorize the underlying Microsoft Graph API](https://github.com/Azure/Microsoft365R/blob/master/inst/app_registration.md) to get this to work at all, but it is common to find these libraries authorized (for other reasons), even in highly secure business environments.  Fortunately, some key [Azure features](https://azure.microsoft.com/en-us/services/graph-data-connect/) rely on this this API also.

In brief, one generates an authentication token for the personal oneDrive account and declares it during an R session using .Renviron (see Renviron_example.txt).  Once the session closes, the token is no longer available.  Be advised that this method depends upon node.js (linked below) and the Microsoft Office 365 Command-Line Interface being installed on the workstation in use.  

## What to expect

When you run the get_personal_onedrive() function the first time, it will either call [httpuv](https://github.com/rstudio/httpuv) (if you're using RStudio Workbench, for example) or give you a URL to target for authentication to your personal Google account using system web browser. 

* That is, if httpuv is not present (or you're doing this over a CLI) it will drop to the "device code" method (one can also pre-select this method with with get_onedrive_personal(auth_type= "device_code")).  You will find a string to enter into any web browser authorized on the personal oneDrive account.

When the authorization with the personal Microsoft account is successful, your CLI key will be printed to your R console.  This is what goes in the .Renviron configuration.

# rdewald.R

My workflow

* copy upload target files to child folder declared in .Renviron.  
* source(rdewald.R)
* delete upload target files (this is a one-way sync)

Good luck!

## .Renviron_example.txt

Paste in your CLI key and save this as .Renviron to do this like I do.

## Helpful Linkage

[About Microsoft365R](https://blog.revolutionanalytics.com/2021/02/microsoft365r.html)

[Install CLI guide](https://pnp.github.io/cli-microsoft365/user-guide/installing-cli/)

[Install node.js](https://nodejs.org/en/)

[Quick start guide](https://devblogs.microsoft.com/microsoft365dev/getting-started-office365-cli-powershell/)

