﻿@{
    ModuleVersion = '0.13.0'
    FormatsToProcess = 'Thycotic.SecretServer.Format.ps1xml'
    TypesToProcess = 'Thycotic.SecretServer.Types.ps1xml'
    RootModule = 'Thycotic.SecretServer.psm1'
    Description = 'PowerShell Tools for Thycotic Secret Server'
    Guid = 'e6b56c5f-41ac-4ba4-8b88-2c063f683176'
    Author = 'Shawn Melton'
    CompanyName = 'Thycotic'
    Copyright = '(c) Thycotic Professional Services. All rights reserved.'
    PowerShellVersion ='5.1'
    PrivateData = @{
        PSData = @{
            PreRelease = 'beta'
            Tags = 'SecretServer', 'Thycotic', 'DevOps'
            ProjectURI = 'https://thycotic.com/products/professional-services-training/'
            LicenseURI = ''
            ReleaseNotes = @"
0.13 :
* Removed Get-TssSession
* Find-TssSecret renamed to Search-TssSecret
* Added TssSession class
* New TssSession parameter added to all public functions
* Added unit test
* Added format and types file
* Get-TssSecret - Modified output
* Search-TssSecret - Added IncludeInactive parameter
0.12 :
* New-TssSession - add comment-based help
* Get-TssSession - add comment-based help
* TestTssSession - update throw message
0.11 :
* Rename TssSession object property AuthToken to AccessToken
* Created build script
0.10 :
* Find-TssSecret fix bug on restricted
0.9 :
---
* Find-TssSecret set to include restricted
0.8 :
---
* Added Get-TssSecretTemplate
0.7 :
---
* Added Set-TssSecret
* Get-TssSecret - format doc example, rework workflow, error handling, add Comment support
* Added TSL1.2 setting for Secret Server Cloud
* Disable-TssSecret add status property
* Find-TssSecret format output
0.6 :
---
* Rename Remove-TssSecret to Disable-TssSecret
* Added alias Remove-TssSecret
0.5 :
---
* Added Remove-TssSecret
0.4 :
---
* Added Find-TssSecret
0.3 :
---
* Enhancement to New-TssSession (parameter and session validating)
0.2 :
---
* Added Invoke-TssRestApi
* Added New-TssSession
0.1 :
---
Initial Commit
"@
        }
    }
}