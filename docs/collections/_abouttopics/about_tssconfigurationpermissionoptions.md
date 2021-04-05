---
category: configurations
title: "TssConfigurationPermissionOptions"
last_modified_at: 2021-04-04T00:00:00-00:00
---

# TOPIC
    This help topic describes the TssConfigurationPermissionOptions class in the Thycotic.SecretServer module

# CLASS
    TssConfigurationPermissionOptions

# INHERITANCE
    None

# DESCRIPTION
    The TssConfigurationPermissionOptions class represents the ConfigurationPermissionOptionsModel returned by Secret Server endpoint GET /configuration/general

# CONSTRUCTORS
    new()

# PROPERTIES
    AllowDuplicateSecretNames
        Allow Secrets to have the same name in the same folder

    AllowViewUserToRetrieveAutoChangeNextPassword
        Users that only have secret view can see the next password

    DefaultSecretPermissions
        Default permissions to be applied when a Secret is created (InheritsPermissions, CopyFromFolder, OnlyAllowCreator)

    EnableApprovalFromEmail
        Allow approval from email

    ForceSecretApproval
        Require approval for secrets (None, RequireApprovalForOwnersAndEditors, RequireApprovalForEditors)

# METHODS

# RELATED LINKS:
    TssConfiguration
    Get-TssConfiguration