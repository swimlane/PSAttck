<#
.SYNOPSIS
    Get-AttckTechnique gives the user access to all Techniques defined within the Mitre ATT&CK framework
.DESCRIPTION
    Get-AttckTechnique can access all Techniques defined within the Mitre ATT&CK framework.
    You can also select a single Technique object by providing a Name value
.PARAMETER Name
    A argument completer parameter to retrieve data about a specific Technique by Name
.EXAMPLE
    Access All Techniques
    C:/> Get-AttckTechnique
.EXAMPLE
    Retrieve a specific Technique by Name
    C:/> Get-AttckTechnique -Name 'Access Token Manipulation'
.EXAMPLE
    Retrieve which Tactics are associated with a Technique
    C:/> (Get-AttckTechnique -Name 'Audio Capture').Tactics()
.EXAMPLE
    Retrieve which Actors use a Technique
    C:/> (Get-AttckTechnique -Name 'Audio Capture').Actors()
.EXAMPLE
    Retrieve mitigation for a given Technique
    C:/> (Get-AttckTechnique -Name 'Audio Capture').Mitigations()
.OUTPUTS
    PSAttck.Enterprise.Technique
.NOTES
    Created By: Josh Rickard (MSAdministrator)
    Date: 21JAN2020
#>
function Get-AttckTechnique {
    [CmdletBinding(DefaultParameterSetName='technique',
                   PositionalBinding=$false,
                   HelpUri = 'http://www.microsoft.com/')]
    Param (
        # Get a Technique object by name
        [Parameter(Mandatory=$false,
                   Position=0,
                   ValueFromPipeline=$true,
                   ParameterSetName='technique')]
        [string]
        $Name
    )

    begin {
        Write-Verbose -Message 'Getting AttckTechnique Object'
    }

    process {
        $PSAttckJson.objects.ForEach({
            if($_.type -eq 'attack-pattern'){
                if ($PSBoundParameters.ContainsKey('Name')){
                    if ($_.name -eq $Name){
                        [EnterpriseTechnique]::new($_) | Add-ObjectDetail -TypeName PSAttck.Enterprise.Technique
                    }
                }
                else{
                    [EnterpriseTechnique]::new($_) | Add-ObjectDetail -TypeName PSAttck.Enterprise.Technique
                }
            }
        })
    }

    end {
    }
}