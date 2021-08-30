function Update-TssSecretDependency {
    <#
    .SYNOPSIS
    Update a Secret Dependency

    .DESCRIPTION
    Update a Secret Dependency

    .EXAMPLE
    session = New-TssSession -SecretServer https://alpha -Credential ssCred
    Update-TssSecretDependency -TssSession $session -Id

    Update ...

    .LINK
    https://thycotic-ps.github.io/thycotic.secretserver/commands/folder/Update-TssSecretDependency

    .LINK
    https://github.com/thycotic-ps/thycotic.secretserver/blob/main/src/functions/folder/Update-TssSecretDependency.ps1

    .NOTES
    Requires TssSession object returned by New-TssSession
    #>
    [cmdletbinding(SupportsShouldProcess)]
    param(
        # TssSession object created by New-TssSession for authentication
        [Parameter(Mandatory, ValueFromPipeline, Position = 0)]
        [Thycotic.PowerShell.Authentication.Session]
        $TssSession,

        # Secret Dependency object
        [Parameter(Mandatory)]
        [Thycotic.PowerShell.SecretDependencies.Dependency]
        $Dependency
    )
    begin {
        $updateParams = $PSBoundParameters
        $invokeParams = . $GetInvokeApiParams $TssSession
    }
    process {
        Write-Verbose "Provided command parameters: $(. $GetInvocation $PSCmdlet.MyInvocation)"
        if ($updateParams.ContainsKey('TssSession') -and $TssSession.IsValidSession()) {
            . $CheckVersion $TssSession '10.9.000064' $PSCmdlet.MyInvocation
            $depObject = $Dependency | ConvertTo-Json -Depth 100 | ConvertFrom-Json
            $uri = $TssSession.ApiUrl, 'secret-dependencies', ($depObject.Id) -join '/'
            $invokeParams.Uri = $uri
            $invokeParams.Method = 'PUT'

            $invokeParams.Body = $depObject | ConvertTo-Json -Depth 100
            if ($PSCmdlet.ShouldProcess("Secret Dependency: $($Dependency.Id)", "$($invokeParams.Method) $($invokeParams.Uri) with: `n$($invokeParams.Body)")) {
                Write-Verbose "$($invokeParams.Method) $uri with: `n$($invokeParams.Body)"
                try {
                    $apiResponse = Invoke-TssApi @invokeParams
                    $restResponse = . $ProcessResponse $apiResponse
                } catch {
                    Write-Warning 'Issue updating Secret Dependency [$dependency]'
                    $err = $_
                    . $ErrorHandling $err
                }

                if ($restResponse) {
                    Write-Verbose "Id $Id updated successfully"
                } else {
                    Write-Warning "Id $Id was not updated, see previous output for errors"
                }
            }
        } else {
            Write-Warning 'No valid session found'
        }
    }
}