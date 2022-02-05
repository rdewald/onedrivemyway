# oneDrive MyWay

This repository is code I used to manage syncing a Windows 10 folder with a personal oneDrive account without adding the account to the Windows 10 native oneDrive app.  This is useful when syncing something up one-time, or when using a computer restricted according to a Windows security policy set which disables personal oneDrive accounts being added to the synchronization application (common with work computers).

Take note that the security policy will have to [authorize the underlying Azure libraries](https://github.com/Azure/Microsoft365R/blob/master/inst/app_registration.md), but it is common to find these libraries authorized (for other reasons) even in highly secure business environments.

In brief, one generates an authentication token for the personal oneDrive account and declares it during an R session using .Renviron (see Renviron_example.txt).  Once the session closes, the token is no longer available.  Be advised that this method depends upon node.js (linked below) and the Microsoft Office 365 Command-Line Interface being installed on the workstation in use.  

Take note, I was also able to install these on a remote server (hosting [RStudio Workbench Server Pro](https://www.rstudio.com/products/rstudio/#rstudio-server) in my use-case) without using a GUI for the purposes of enabling oneDrive business accounts as well.

## What to expect

When you run the get_personal_onedrive() function the first time, it will either call [httpuv](https://github.com/rstudio/httpuv) (if you're using RStudio Workbench, for example) to get you to authenticate with your system web browser, or, if httpuv is not present, or you're doing this over a CLI, it will drop to the "device code" method (one can pre-select this method with with get_onedrive_personal(auth_type= "device_code")) and give you a TEXT string to enter into any web browser that is authorized on the personal oneDrive account (like your cell phone) much like authorizing a TV streaming application or similar.

Good luck!

## .Renviron_example.txt

Paste in your CLI key and save this as .Renviron to do this like I do.

## Helpful Linkage

[About Microsoft365R](https://blog.revolutionanalytics.com/2021/02/microsoft365r.html)

[Install CLI guide](https://pnp.github.io/cli-microsoft365/user-guide/installing-cli/)

[Install node.js](https://nodejs.org/en/)

[Quick start guide](https://devblogs.microsoft.com/microsoft365dev/getting-started-office365-cli-powershell/)

