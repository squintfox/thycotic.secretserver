function Update-TssSecretPolicy {
    <#
    .SYNOPSIS
    Update a Secret Policy

    .DESCRIPTION
    Update a Secret Policy

    .LINK
    https://thycotic-ps.github.io/thycotic.secretserver/commands/secret-policies/Update-TssSecretPolicy

    .LINK
    https://github.com/thycotic-ps/thycotic.secretserver/blob/main/src/functions/secret-policies/Update-TssSecretPolicy.ps1

    .EXAMPLE
    $session = New-TssSession -SecretServer https://alpha -Credential $ssCred
    New-TssSecretPolicyItem -TssSession $session -Id some test value

    Add minimum example for each parameter

    .NOTES
    Requires TssSession object returned by New-TssSession
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param (
        # TssSession object created by New-TssSession for authentication
        [Parameter(Mandatory,ValueFromPipeline,Position = 0)]
        [Thycotic.PowerShell.Authentication.Session]
        $TssSession,

        # Secret Policy ID
        [Parameter(Mandatory)]
        [int]
        $PolicyId,

        # Secret Policy ID Active state
        [switch]
        $Active,

        # Policy Item Name (tab to go through list)
        [Thycotic.PowerShell.Enums.SecretPolicyItem]
        $PolicyItem,

        # Apply type (NotSet, Default, Enforced)
        [Thycotic.PowerShell.Enums.SecretPolicyApplyType]
        $ApplyType,

        # Type of value provided (Bool, Int, SecretId, Group, Schedule, SshMenuGroup, SshBlocklist)
        [Thycotic.PowerShell.Enums.SecretPolicyValueType]
        $ValueType,

        # Value to provide, should match the ValueType (e.g. Bool = $true/$false, SecretId = ID number, etc.)
        [object]
        $Value,

        # User/Group Mapping a hashtable containing UserGroupId, UserGroupMapType (User,Group)
        [object]
        $UserGroupMapping
    )
    begin {
        $updateParams = $PSBoundParameters
        $invokeParams = . $GetInvokeApiParams $TssSession

        if ($ValueType -eq 'Group') {
            if (-not $updateParams.ContainsKey('UserGroupMapping')) {
                Write-Error "Value Type of [Group] requires a UserGroupMapping hashtable to be provided"
            }
        }
    }
    process {
        Write-Verbose "Provided command parameters: $(. $GetInvocation $PSCmdlet.MyInvocation)"
        if ($updateParams.ContainsKey('TssSession') -and $TssSession.IsValidSession()) {
            . $CheckVersion $TssSession '10.9.000000' $PSCmdlet.MyInvocation
            $uri = $TssSession.ApiUrl, 'secret-policy', $PolicyId -join '/'
            $invokeParams.Uri = $uri
            $invokeParams.Method = 'PATCH'

            $updateBody = @{data = @{} }
            $policyItemArray = @{}
            switch ($updateParams.Keys) {
                'Active' {
                    $policyActive = @{
                        dirty = $true
                        value = [boolean]$Active
                    }
                    $updateBody.data.Add('active',$policyActive)
                }
                'PolicyItem' {
                    $policyItemId = @{
                        dirty = $true
                        value = $PolicyItem
                    }
                    $policyItemArray.Add('secretPolicyItemId',$policyItemId)
                }
                'ApplyType' {
                    $policyApplyType = @{
                        dirty  = $true
                        $value = [string]$ApplyType
                    }
                    $policyItemArray.Add('policyApplyType',$policyApplyType)
                }
                'ValueType' {
                    if ($updateParams.ContainsKey('Value')) {
                        switch ($ValueType) {
                            'Bool' {
                                $vBool = @{
                                    dirty = $true
                                    value = [boolean]$Value
                                }
                                $policyItemArray.Add('valueBool',$vBool)
                            }
                            'Int' {
                                $vInt = @{
                                    dirty = $true
                                    value = [int]$Value
                                }
                                $policyItemArray.Add('valueInt',$vInt)
                            }
                            'SecretId' {
                                $vSecretId = @{
                                    dirty = $true
                                    value = [int]$Value
                                }
                                $policyItemArray.Add('valueSecretId',$vSecretId)
                            }
                            'Schedule' {
                                $vSchedule = @{
                                    dirty = $true
                                    value = [string]$Value
                                }
                                $policyItemArray.Add('valueString',$vSchedule)
                            }
                            'Group' {
                                $vGroup = @{
                                    dirty = $true
                                    value = $UserGroupMapping
                                }
                                $policyItemArray.Add('userGroupMaps',$vGroup)
                            }
                            default {
                                $vDefault = @{
                                    dirty = $value
                                    value = [string]$Value
                                }
                                $policyItemArray.Add('ValueString',$vDefault)
                            }
                        }
                    } else {
                        Write-Warning "A value object must be provided based on the ValueType [$ValueType]"
                        return
                    }
                }
            }
            if ($policyItemArray) {
                $updateBody.data.Add('secretPolicyItems',@($policyItemArray))
            }
            $invokeParams.Body = $updateBody | ConvertTo-Json -Depth 80

            if (-not $PSCmdlet.ShouldProcess("Secret Policy $PolicyId", "$($invokeParams.Method) $($invokeParams.Uri) with $($invokeParams.Body)")) { return }
            Write-Verbose "Performing the operation $($invokeParams.Method) $($invokeParams.Uri) with:`n $newBody"
            try {
                $apiResponse = Invoke-TssApi @invokeParams
                $restResponse = . $ProcessResponse $apiResponse
            } catch {
                Write-Warning "Issue creating report []"
                $err = $_
                . $ErrorHandling $err
            }

            if ($restResponse) {
                $restResponse
            }
        } else {
            Write-Warning 'No valid session found'
        }
    }
}