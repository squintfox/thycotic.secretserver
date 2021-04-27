---
category: groups
external help file: Thycotic.SecretServer-help.xml
Module Name: Thycotic.SecretServer
online version: https://thycotic-ps.github.io/thycotic.secretserver/commands/Get-TssGroupMember
schema: 2.0.0
title: Get-TssGroupMember
---

# Get-TssGroupMember

## SYNOPSIS
Get a Group's membership

## SYNTAX

```
Get-TssGroupMember [-TssSession] <TssSession> -Id <Int32[]> [-IncludeInactive] [-UserDomainId <Int32>]
 [-SortBy <String>] [<CommonParameters>]
```

## DESCRIPTION
Get a Group's membership

## EXAMPLES

### EXAMPLE 1
```
$session = New-TssSession -SecretServer https://alpha -Credential $ssCred
Get-TssGroupMember -TssSession $session -Id 2
```

Get users that are members of Group 2

## PARAMETERS

### -TssSession
TssSession object created by New-TssSession for auth

```yaml
Type: TssSession
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Id
Group ID

```yaml
Type: Int32[]
Parameter Sets: (All)
Aliases: GroupId

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -IncludeInactive
Include inactive Users in Group

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

### -UserDomainId
Members that are in a specific domain

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -SortBy
Sort by specific property, default DisplayName

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: DisplayName
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### TssGroupUserSummary
## NOTES
Requires TssSession object returned by New-TssSession

## RELATED LINKS

[https://thycotic-ps.github.io/thycotic.secretserver/commands/Get-TssGroupMember](https://thycotic-ps.github.io/thycotic.secretserver/commands/Get-TssGroupMember)

[https://github.com/thycotic-ps/thycotic.secretserver/blob/main/src/functions/<folder>/Get-GroupMember.ps1](https://github.com/thycotic-ps/thycotic.secretserver/blob/main/src/functions/<folder>/Get-GroupMember.ps1)
