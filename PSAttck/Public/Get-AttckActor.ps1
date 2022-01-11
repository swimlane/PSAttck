<#
.SYNOPSIS
    Get-AttckActor gives the user access to all Actors of Groups defined within the Mitre ATT&CK framework
.DESCRIPTION
    Get-AttckActor can access all Actors of Groups defined within the Mitre ATT&CK framework.
    You can also select a single Actor by providing a Name value
.PARAMETER Name
    A argument completer parameter to retrieve data about a specific Actor by Name
.EXAMPLE 
    Access All Actor Information
    C:/> Get-AttckActor
.EXAMPLE 
    Retrieve a specific Actor by Name
    C:/> Get-AttckActor -Name 'APT1'
.EXAMPLE 
    Retrieve a specific Actors Techniques
    C:/> (Get-AttckActor -Name 'APT1').Techniques()
.EXAMPLE 
    Retrieve a specific Actors Malware
    C:/> (Get-AttckActor -Name 'APT1').Malwares()
.EXAMPLE 
    Retrieve a specific Actors Tools
    C:/> (Get-AttckActor -Name 'APT1').Tools()
.EXAMPLE
    Retrieve a Actor by Id
    C:/> Get-AttckMitigation -Id 'G0112'
.OUTPUTS
    PSAttck.Enterprise.Actor
.NOTES
    Created By: Josh Rickard (MSAdministrator)
    Date: 21JAN2020
#>
function Get-AttckActor {
    [CmdletBinding(DefaultParameterSetName='actor',
                   PositionalBinding=$false,
                   HelpUri = 'http://www.microsoft.com/')]
    Param (
        # Get a Actor object by name
        [Parameter(Mandatory=$false,
                   Position=0,
                   ValueFromPipeline=$true,
                   ParameterSetName='actor')]
        [string]
        $Name,

        # Get a Actor object by id
        [Parameter(Mandatory=$false,
                   Position=1,
                   ValueFromPipeline=$true,
                   ParameterSetName='actor')]
        [string]
        $Id,

        # Display revoked actors
        [Parameter(Mandatory=$false,
                   Position=2,
                   ValueFromPipeline=$true,
                   ParameterSetName='technique')]
        [switch]
        $ShowRevoked=$false
    )

    begin {
        Write-Verbose -Message 'Getting AttckActor Object'
    }

    process {
        $PSAttckJson.objects.ForEach({
            if($_.type -eq 'intrusion-set' -and ($_.revoked -eq $ShowRevoked -or -not($_.revoked))){
                if ($PSBoundParameters.ContainsKey('Name')){
                    if ($_.name -eq $Name){
                        [EnterpriseActor]::new($_) | Add-ObjectDetail -TypeName PSAttck.Enterprise.Actor
                    }
                }
                elseif ($PSBoundParameters.ContainsKey('Id')){
                    foreach ($ref in $_.external_references){
                        if ($ref.source_name -eq 'mitre-attack' -and $ref.external_id -eq $Id){
                            [EnterpriseActor]::new($_) | Add-ObjectDetail -TypeName PSAttck.Enterprise.Actor
                        }
                    }
                }
                else{
                    [EnterpriseActor]::new($_) | Add-ObjectDetail -TypeName PSAttck.Enterprise.Actor
                }
            }
        })
    }

    end {
    }
}