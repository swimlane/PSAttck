<#
.SYNOPSIS
    Retrieve your PSAttck Configuration
.DESCRIPTION
    Retrieve your PSAttck configuration file which is stored as JSON file when running Set-PSAttckConfiguration
.EXAMPLE
    Get-PSAttckConfiguration
.INPUTS
    Inputs to this cmdlet (if any)
.OUTPUTS
    Json Object
#>
function Get-PSAttckConfiguration {
    [CmdletBinding(DefaultParameterSetName='Parameter Set 1',
                   PositionalBinding=$false,
                   HelpUri = 'http://www.microsoft.com/')]
    Param (
    )

    begin {
        Write-Verbose -Message 'Getting PSAttck Configuration'
    }

    process {
        if (-not (Get-ChildItem -Path "$HOME/PSAttck/config.json" -ErrorAction SilentlyContinue)){
            Write-Warning -Message "PSAttck config.json cannot be found at the following location: $HOME/PSAttck/config.json"
        }
        else{
            Get-Content -Path "$HOME/PSAttck/config.json" | ConvertFrom-Json
        }
    }

    end {
    }
}