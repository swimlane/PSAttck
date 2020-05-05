<#
.SYNOPSIS
    Get-AttckTactic gives the user access to all Tactics defined within the Mitre ATT&CK framework
.DESCRIPTION
    Get-AttckTactic can access all Tactics defined within the Mitre ATT&CK framework.
    You can also select a single Tactic object by providing a Name value
.PARAMETER Name
    A argument completer parameter to retrieve data about a specific Tactic by Name
.EXAMPLE
    Access All Tactics
    C:/> Get-AttckTactic
.EXAMPLE
    Retrieve a specific Tactic by Name
    C:/> Get-AttckTactic -Name 'Collection'
.EXAMPLE
    Retrieve which techniques are associated with a Tactic
    C:/> (Get-AttckTactic -Name 'Collection').Techniques()
.OUTPUTS
    PSAttck.Enterprise.Tactic
.NOTES
    Created By: Josh Rickard (MSAdministrator)
    Date: 21JAN2020
#>
function Get-AttckTactic {
    [CmdletBinding(DefaultParameterSetName='tactic',
                   PositionalBinding=$false,
                   HelpUri = 'http://www.microsoft.com/')]
    Param (
        # Get a Tactic object by name
        [Parameter(Mandatory=$false,
                   Position=0,
                   ValueFromPipeline=$true,
                   ParameterSetName='tactic')]
        [string]
        $Name
    )

    begin {
        Write-Verbose -Message 'Getting AttckTactic Object'
    }

    process {
        $PSAttckJson.objects.ForEach({
            if($_.type -eq 'x-mitre-tactic'){
                if ($PSBoundParameters.ContainsKey('Name')){
                    if ($_.name -eq $Name){
                        [EnterpriseTactic]::new($_) | Add-ObjectDetail -TypeName PSAttck.Enterprise.Tactic
                    }
                }
                else{
                    [EnterpriseTactic]::new($_) | Add-ObjectDetail -TypeName PSAttck.Enterprise.Tactic
                }
            }
        })
    }

    end {
    }
}