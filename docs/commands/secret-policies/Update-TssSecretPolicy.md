# Update-TssSecretPolicy

## SYNOPSIS
Update a Secret Policy

## SYNTAX

```
Update-TssSecretPolicy [-TssSession] <Session> -PolicyId <Int32> [-Active] [-PolicyItem <SecretPolicyItem>]
 [-ApplyType <SecretPolicyApplyType>] [-ValueType <SecretPolicyValueType>] [-Value <Object>]
 [-UserGroupMapping <Object>] [-SshCommandUserGroupMapping <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Update a Secret Policy

## EXAMPLES

### EXAMPLE 1
```
$session = New-TssSession -SecretServer https://alpha -Credential $ssCred
New-TssSecretPolicyItem -TssSession $session -Id some test value
```

Add minimum example for each parameter

## PARAMETERS

### -TssSession
TssSession object created by New-TssSession for authentication

```yaml
Type: Session
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -PolicyId
Secret Policy ID

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Active
Secret Policy ID Active state

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -PolicyItem
Policy Item Name (tab to go through list)

```yaml
Type: SecretPolicyItem
Parameter Sets: (All)
Aliases:
Accepted values: AutoChangeOnExpiration, HeartBeatEnabled, SiteId, PrivilegedSecretId, AssociatedSecretId1, AutoChangeSchedule, PasswordTypeWebScriptId, CheckOutEnabled, CheckOutIntervalMinutes, CheckOutChangePassword, RequireApprovalForAccess, RequireApprovalForAccessForOwnersAndApprovers, RequireApprovalForAccessForEditors, RequireViewComment, IsSessionRecordingEnabled, HideLauncherPassword, ApprovalGroup, AssociatedSecretId2, IsProxyEnabled, EnableSshCommandRestrictions, SshCommandMenuGroups, AllowOwnersUnrestrictedSshCommands, ApprovalWorkflow, EventPipelinePolicy, RunLauncherUsingSSHKey, WebLauncherRequiresIncognitoMode, SshCommandRestrictionType, SshCommandBlocklistOwners, SshCommandBlocklistEditors, SshCommandBlocklistViewers

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ApplyType
Apply type (NotSet, Default, Enforced)

```yaml
Type: SecretPolicyApplyType
Parameter Sets: (All)
Aliases:
Accepted values: NotSet, Default, Enforced

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ValueType
Type of value provided (Bool, Int, SecretId, Group, Schedule, SshMenuGroup, SshBlocklist)

```yaml
Type: SecretPolicyValueType
Parameter Sets: (All)
Aliases:
Accepted values: Bool, Int, SecretId, Group, Schedule, SshMenuGroup, SshBlocklist

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Value
Value to provide, should match the ValueType (e.g.
Bool = $true/$false, SecretId = ID number, etc.)

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UserGroupMapping
User/Group Mapping a hashtable containing UserGroupId, UserGroupMapType (User,Group)

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SshCommandUserGroupMapping
{{ Fill SshCommandUserGroupMapping Description }}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Requires TssSession object returned by New-TssSession

## RELATED LINKS

[https://thycotic-ps.github.io/thycotic.secretserver/commands/secret-policies/Update-TssSecretPolicy](https://thycotic-ps.github.io/thycotic.secretserver/commands/secret-policies/Update-TssSecretPolicy)

[https://github.com/thycotic-ps/thycotic.secretserver/blob/main/src/functions/secret-policies/Update-TssSecretPolicy.ps1](https://github.com/thycotic-ps/thycotic.secretserver/blob/main/src/functions/secret-policies/Update-TssSecretPolicy.ps1)

