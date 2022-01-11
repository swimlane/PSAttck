<#
.SYNOPSIS
    Get-AttckTool gives the user access to all Tools defined within the Mitre ATT&CK framework
.DESCRIPTION
    Get-AttckTool can access all Tools defined within the Mitre ATT&CK framework.
    You can also select a single Tool object by providing a Name value
.PARAMETER Name
    A argument completer parameter to retrieve data about a specific Tool by Name
.EXAMPLE
    Access All Tools
    C:/> Get-AttckTool
.EXAMPLE
    Retrieve a specific Tool by Name
    C:/> Get-AttckTool -Name 'Arp'
.EXAMPLE
    Retrieve techniques for a given Tool
    C:/> (Get-AttckTool -Name 'Arp').Techniques()
.EXAMPLE
    Retrieve actors who are known to use a given Tool
    C:/> (Get-AttckTool -Name 'Arp').Actors()
.EXAMPLE
    Retrieve an Actor by Id
    C:/> Get-AttckTool -Id 'S0106'
.OUTPUTS
    PSAttck.Enterprise.Tool
.NOTES
    Created By: Josh Rickard (MSAdministrator)
    Date: 21JAN2020
#>
function Get-AttckTool {
    [CmdletBinding(DefaultParameterSetName='tool',
                   PositionalBinding=$false,
                   HelpUri = 'http://www.microsoft.com/')]
    Param (
        # Get a Tool object by name
        [Parameter(Mandatory=$false,
                   Position=0,
                   ValueFromPipeline=$true,
                   ParameterSetName='tool')]
        [string]
        $Name,

        # Get a Tool object by id
        [Parameter(Mandatory=$false,
                   Position=1,
                   ValueFromPipeline=$true,
                   ParameterSetName='tool')]
        [string]
        $Id
    )

    begin {
        Write-Verbose -Message 'Getting AttckTool Object'
    }

    process {
        $PSAttckJson.objects.ForEach({
            if($_.type -eq 'tool'){
                if ($PSBoundParameters.ContainsKey('Name')){
                    if ($_.name -eq $Name){
                        [EnterpriseTool]::new($_) | Add-ObjectDetail -TypeName PSAttck.Enterprise.Tool
                    }
                }
                elseif ($PSBoundParameters.ContainsKey('Id')){
                    foreach ($ref in $_.external_references){
                        if ($ref.source_name -eq 'mitre-attack' -and $ref.external_id -eq $Id){
                            [EnterpriseTool]::new($_) | Add-ObjectDetail -TypeName PSAttck.Enterprise.Tool
                        }
                    }
                }
                else{
                    [EnterpriseTool]::new($_) | Add-ObjectDetail -TypeName PSAttck.Enterprise.Tool
                }
            }
        })
    }

    end {
    }
}