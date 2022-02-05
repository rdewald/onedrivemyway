# oneDrive MyWay

This repository is code I used to manage syncing a Windows 10 folder with a personal oneDrive account without adding the account to the Windows !0 native oneDrive app.  This is useful when syncing something up one-time, or when using a computer restricted according to a Windows security policy set which disables personal oneDrive accounts being added to the synchronization application (common with work computers).

Take note that the security policy will have to [authorize the underlying Azure libraries](https://github.com/Azure/Microsoft365R/blob/master/inst/app_registration.md), but it is common to find these libraries authorized (for other reasons) even in highly secure business environments.

In brief, one generates a token for the personal oneDrive account and declares it during an R session using .Renviron (see Renviron_example.txt).  Once the session closes, the token is no longer available.

Be advised that this method depends upon node.js (linked below) and the Microsoft Office 365 Command-Line Interface.  I chose to install these on a remote server without using a GUI.

## Helpful Linkage

[About Microsoft365R](https://blog.revolutionanalytics.com/2021/02/microsoft365r.html)

[Install CLI guide](https://pnp.github.io/cli-microsoft365/user-guide/installing-cli/)

[Install node.js](https://nodejs.org/en/)

[Quick start guide](https://devblogs.microsoft.com/microsoft365dev/getting-started-office365-cli-powershell/)

