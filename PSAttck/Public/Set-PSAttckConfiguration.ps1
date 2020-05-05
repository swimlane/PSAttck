<#
.SYNOPSIS
    Set your PSAttck Configuration
.DESCRIPTION
    Set your PSAttck configuration file which is stored as JSON file and can be retrieved by using Get-PSAttckConfiguration
.PARAMETER AttckJsonPath
    The path to a local Mitre ATT&CK Enterprise framework json file
.PARAMETER AttckDatasetPath
    The path to a local generated dataset json file
.EXAMPLE
    Downloading from the external sources and saving values to a PSAttck Configuration file
    Set-PSAttckConfiguration
.EXAMPLE
    Providing an alternate path for the Mitre ATT&CK JSON file and saving this in your PSAttck Configuration file
    Set-PSAttckConfiguration -AttckJsonPath 'C:\users\name\psattck\my_attck_json.json
.EXAMPLE
    Providing an alternate path for the generated data set JSON file and saving this in your PSAttck Configuration file
    Set-PSAttckConfiguration -AttckDatasetPath 'C:\users\name\psattck\my_local_generated_dataset.json
.OUTPUTS
    Json Object
#>
function Set-PSAttckConfiguration {
    [CmdletBinding(DefaultParameterSetName='Parameter Set 1',
                   PositionalBinding=$false,
                   HelpUri = 'http://www.microsoft.com/')]
    Param (
        # File path to store PSAttck JSON Data
        [Parameter(Mandatory=$false,
                   Position=0,
                   ValueFromPipeline=$true,
                   ParameterSetName='Parameter Set 1')]
        [ValidateScript({
            if( -Not ($_ -match '.json') ){
                throw "Path must contain .json"
            }
            return $true
        })]
        $AttckJsonPath,

        # File path to store PSAttck JSON Dataset
        [Parameter(Mandatory=$false,
                   Position=1,
                   ValueFromPipeline=$true,
                   ParameterSetName='Parameter Set 1')]
        [ValidateScript({
            if( -Not ($_ -match '.json') ){
                throw "Path must contain .json"
            }
            return $true
        })]
        $AttckDatasetPath
    )

    begin {
        Write-Verbose -Message 'Setting PSAttck Configuration'
        if (-not($PSBoundParameters.ContainsKey('AttckJsonPath'))){
            New-Item -ItemType Directory -Force -Path "$HOME/PSAttck/"
            $AttckJsonPath = "$HOME/PSAttck/AttckJson.json"
        }
        if (-not($PSBoundParameters.ContainsKey('AttckDatasetPath'))){
            New-Item -ItemType Directory -Force -Path "$HOME/PSAttck/"
            $AttckDatasetPath = "$HOME/PSAttck/AttckDataset.json"
        }
    }

    process {
        [PSCustomObject]@{
            AttckJsonPath = $AttckJsonPath
            AttckDatasetPath = $AttckDatasetPath
        } | ConvertTo-Json | Out-File -FilePath "$HOME/PSAttck/config.json" -Force
    }

    end {
    }
}