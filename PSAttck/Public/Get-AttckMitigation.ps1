<#
.SYNOPSIS
    Get-AttckMitigation gives the user access to all Mitigations defined within the Mitre ATT&CK framework
.DESCRIPTION
    Get-AttckMitigation can access all Mitigations defined within the Mitre ATT&CK framework.
    You can also select a single Mitigation object by providing a Name value
.PARAMETER Name
    A argument completer parameter to retrieve data about a specific Mitigation by Name
.EXAMPLE
    Access All Mitigations
    C:/> Get-AttckMitigation
.EXAMPLE
    Retrieve a specific Mitigation by Name
    C:/> Get-AttckMitigation -Name 'Winlogon Helper DLL Mitigation'
.EXAMPLE
    Retrieve which techniques apply to a specific Mitigation
    C:/> (Get-AttckMitigation -Name 'Account Discovery Mitigation').Techniques()
.OUTPUTS
    PSAttck.Enterprise.Mitigation
.NOTES
    Created By: Josh Rickard (MSAdministrator)
    Date: 21JAN2020
#>
function Get-AttckMitigation {
    [CmdletBinding(DefaultParameterSetName='mitigation',
                   PositionalBinding=$false,
                   HelpUri = 'http://www.microsoft.com/')]
    Param (
        # Get a Mitigation object by name
        [Parameter(Mandatory=$false,
                   Position=0,
                   ValueFromPipeline=$true,
                   ParameterSetName='mitigation')]
        [string]
        $Name
    )

    begin {
        Write-Verbose -Message 'Getting AttckMitigation Object'
    }

    process {
        $PSAttckJson.objects.ForEach({
            if($_.type -eq 'course-of-action'){
                if ($PSBoundParameters.ContainsKey('Name')){
                    if ($_.name -eq $Name){
                        [EnterpriseMitigation]::new($_) | Add-ObjectDetail -TypeName PSAttck.Enterprise.Mitigation
                    }
                }
                else{
                    [EnterpriseMitigation]::new($_) | Add-ObjectDetail -TypeName PSAttck.Enterprise.Mitigation
                }
            }
        })
    }

    end {
    }
}