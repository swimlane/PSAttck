<#
.SYNOPSIS
    Get-Attck is meant as an entry point to all Mitre ATT&CK data but it can also filter by property and value
.DESCRIPTION
    Get-Attck can access all Mitre ATT&CK data.  You can also use the FilterBy and Value properties to filter through specific
    attributes and values.  Depending on the switch value you have selected, you can FilterBy property name
    as well as select a specific property value.
.PARAMETER Actor
    A switch parameter to retrieve data about Actors
.PARAMETER Malware
    A switch parameter to retrieve data about Malwares
.PARAMETER Tactic
    A switch parameter to retrieve data about Tactics
.PARAMETER Technique
    A switch parameter to retrieve data about Techniques
.PARAMETER Tool
    A switch parameter to retrieve data about Tools
.PARAMETER FilterBy
    A argument completer parameter that retrieves all properties on a given data object
    This is based on the provided switch scope (e.g. Data object type)
.PARAMETER Value
    A argumentt completer parameter that retrieves all values from the select FilterBy property
    This is based on the provided switch scope (e.g. Data object type)
.EXAMPLE
    Access All Actor Information
    C:/> Get-Attck -Actor
.EXAMPLE
    Retrieve a specific property from all Actors
    C:/> Get-Attck -Actor -FilterBy Name
.EXAMPLE
    Retrieve a specific Actor based on a property and it's value
    C:/> Get-Attck -Actor -FilterBy Name -Value 'OilRig'
.EXAMPLE
    Retrieve a specific Actor based on a property and it's value and access the Actors Techniques
    C:/> (Get-Attck -Actor -FilterBy Name -Value 'OilRig').Techniques()
.EXAMPLE
    Retrieve a specific Actor based on a property and it's value and access the Actors Malware
    C:/> (Get-Attck -Actor -FilterBy Name -Value 'OilRig').Malwares()
.EXAMPLE
    Retrieve a specific Actor based on a property and it's value and the Actors Tools
    C:/> (Get-Attck -Actor -FilterBy Name -Value 'OilRig').Tools()
.OUTPUTS
    PSAttck.Enterprise.Actor
    PSAttck.Enterprise.Malware
    PSAttck.Enterprise.Tactic
    PSAttck.Enterprise.Technique
    PSAttck.Enterprise.Tool
.NOTES
    Both the FilterBy and Value properties will pre-populate values based on the selected Type of data you are filtering
    These properties are using ArgumentCompleters for ease of use
#>
function Get-Attck {
    [CmdletBinding(DefaultParameterSetName='attck',
                   PositionalBinding=$false,
                   HelpUri = 'http://www.microsoft.com/',
                   ConfirmImpact='Medium')]
    [Alias()]
    [OutputType([String])]
    Param (
        # Set the scope to Actors
        [Parameter(Mandatory=$true,
                   Position=0,
                   ValueFromPipelineByPropertyName=$true,
                   ParameterSetName = 'actor'
                   )]
        [Switch]
        $Actor,

        # Set the scope to Tools
        [Parameter(Mandatory=$true,
                   Position=1,
                   ValueFromPipelineByPropertyName=$true,
                   ParameterSetName = 'tools'
                   )]
        [Switch]
        $Tool,

        # Set the scope to Malwares
        [Parameter(Mandatory=$true,
                   Position=2,
                   ValueFromPipelineByPropertyName=$true,
                   ParameterSetName = 'malware'
                   )]
        [Switch]
        $Malware,

        # Set the scope to Tactics
        [Parameter(Mandatory=$true,
                   Position=2,
                   ValueFromPipelineByPropertyName=$true,
                   ParameterSetName = 'tactic'
                   )]
        [Parameter(Mandatory=$true,
                   Position=2,
                   ValueFromPipelineByPropertyName=$true,
                   ParameterSetName='technique'
                    )]
        [Switch]
        $Tactic,

        # Set the scope to Techniques
        [Parameter(Mandatory=$true,
                   Position=3,
                   ValueFromPipelineByPropertyName=$true,
                   ParameterSetName='technique'
                   )]
        [Switch]
        $Technique,

        # Once a scope is set you can FilterBy that objects property name
        [Parameter(Mandatory=$false,
                   Position=4,
                   ValueFromPipelineByPropertyName=$true
                   )]
        $FilterBy,

        # Once a scope is set and a FilterBy property name is selected you can filter by that properties value
        [Parameter(Mandatory=$false,
                   Position=5,
                   ValueFromPipelineByPropertyName=$true
                   )]
        $Value
    )

    begin{
        Write-Verbose -Message 'Getting Attck Object'
    }

    process{
        if ($Actor){
            (Get-AttckActor).ForEach({
                if ($FilterBy){
                    if ($Value){
                        if ($_.$($FilterBy) -match $Value){
                            $_ | Add-ObjectDetail -TypeName PSAttck.Enterprise.Actor
                        }
                    }
                    else{
                        $_ | Add-ObjectDetail -TypeName PSAttck.Enterprise.Actor | Select-Object -Property $($FilterBy)
                    }
                }
                else{
                    $_ | Add-ObjectDetail -TypeName PSAttck.Enterprise.Actor
                }
            })
        }
        if ($Malware){
            (Get-AttckMalware).ForEach({
                if ($FilterBy){
                    if ($Value){
                        if ($_.$($FilterBy) -match $Value){
                            $_ | Add-ObjectDetail -TypeName PSAttck.Enterprise.Malware
                        }
                    }
                    else{
                        $_ | Add-ObjectDetail -TypeName PSAttck.Enterprise.Malware | Select-Object -Property $($FilterBy)
                    }
                }
                else{
                    $_ | Add-ObjectDetail -TypeName PSAttck.Enterprise.Malware
                }
            })
        }
        if ($Tactic){
            (Get-AttckTactic).ForEach({
                if ($FilterBy){
                    if ($Value){
                        if ($_.$($FilterBy) -match $Value){
                            $_ | Add-ObjectDetail -TypeName PSAttck.Enterprise.Tactic
                        }
                    }
                    else{
                        $_ | Add-ObjectDetail -TypeName PSAttck.Enterprise.Tactic | Select-Object -Property $($FilterBy)
                    }
                }
                else{
                    $_ | Add-ObjectDetail -TypeName PSAttck.Enterprise.Tactic
                }
            })
        }
        if ($Technique){
            (Get-AttckTechnique).ForEach({
                if ($FilterBy){
                    if ($Value){
                        if ($_.$($FilterBy) -match $Value){
                            $_ | Add-ObjectDetail -TypeName PSAttck.Enterprise.Technique
                        }
                    }
                    else{
                        $_ | Add-ObjectDetail -TypeName PSAttck.Enterprise.Technique | Select-Object -Property $($FilterBy)
                    }
                }
                else{
                    $_ | Add-ObjectDetail -TypeName PSAttck.Enterprise.Technique
                }
            })
        }
        if ($Tool){
            (Get-AttckTool).ForEach({
                if ($FilterBy){
                    if ($Value){
                        if ($_.$($FilterBy) -match $Value){
                            $_ | Add-ObjectDetail -TypeName PSAttck.Enterprise.Tool
                        }
                    }
                    else{
                        $_ | Add-ObjectDetail -TypeName PSAttck.Enterprise.Tool | Select-Object -Property $($FilterBy)
                    }
                }
                else{
                    $_ | Add-ObjectDetail -TypeName PSAttck.Enterprise.Tool
                }
            })
        }
    }

    end{
    }
}