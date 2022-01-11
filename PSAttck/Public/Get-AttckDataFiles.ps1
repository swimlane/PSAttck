<#
.SYNOPSIS
    Get-AttckDataFiles gives the user access to different data files
.DESCRIPTION
    Get-AttckDataFiles is used internally and shouldn't be used externally
.PARAMETER AttckJson
    A switch to get AttckJson
.PARAMETER AttckDataset
     A switch to get AttckDataset
.EXAMPLE
    Get AttckJson
    C:/> Get-AttckDataFiles -AttckJson
.OUTPUTS
    json
.NOTES
    Created By: Josh Rickard (MSAdministrator)
    Date: 21JAN2020
#>
function Get-AttckDataFiles {
    [CmdletBinding(DefaultParameterSetName='attckjson',
                   SupportsShouldProcess=$true,
                   PositionalBinding=$false,
                   HelpUri = 'http://www.microsoft.com/',
                   ConfirmImpact='Medium')]
    [Alias()]
    [OutputType([String])]
    Param (
        # Gets AttckJson
        [Parameter(Mandatory=$true,
                   Position=0,
                   ValueFromPipeline=$true,
                   ParameterSetName='attckjson')]
        [switch]
        $AttckJson,

        # Gets external Attck Dataset
        [Parameter(Mandatory=$true,
                   Position=1,
                   ValueFromPipeline=$true,
                   ParameterSetName='attckdataset')]
        [switch]
        $AttckDataset
    )

    begin {
        $attckJsonUrl = 'https://raw.githubusercontent.com/mitre/cti/master/enterprise-attack/enterprise-attack.json'
        $attckDatasetUrl = 'https://swimlane-pyattck.s3.us-west-2.amazonaws.com/generated_attck_data.json'

        $attckJsonPath = "$env:HOME\PSAttck\AttckJson.json"
        $attckDatasetPath = "$env:HOME\PSAttck\AttckDataset.json"

        Write-Debug -Message 'Checking for local configuration file first'

        $config = Get-PSAttckConfiguration
    }

    process {
        if ($config){
            if ($PSBoundParameters.ContainsKey('AttckJson')){
                Write-Debug -Message 'Getting ATT&CK json path based on config'

                if (-Not(Get-ChildItem -Path $config.AttckJsonPath -ErrorAction SilentlyContinue)){
                    New-Item -Path $config.AttckJsonPath -ItemType File -Force -ErrorAction SilentlyContinue | Out-Null
                    Invoke-RestMethod -Uri $attckJsonUrl -OutFile $config.AttckJsonPath | Out-Null
                    try{
                        Get-Content -Path $config.AttckJsonPath | ConvertFrom-Json | Write-Output
                    }
                    catch{
                        Set-PSAttckConfiguration -AttckJsonPath $config.AttckJsonPath
                        Get-Content -Path $config.AttckJsonPath | ConvertFrom-Json | Write-Output
                    }
                }
                else{
                    try{
                        Get-Content -Path $config.AttckJsonPath | ConvertFrom-Json | Write-Output
                    }
                    catch{
                        Set-PSAttckConfiguration -AttckJsonPath $config.AttckJsonPath
                        Get-Content -Path $config.AttckJsonPath | ConvertFrom-Json | Write-Output
                    }
                }
            }
            else{
                Write-Debug -Message 'Getting ATT&CK dataset json path based on config'

                if (-Not(Get-ChildItem -Path $config.AttckDatasetPath -ErrorAction SilentlyContinue)){
                    New-Item -Path $config.AttckDatasetPath -ItemType File -Force -ErrorAction SilentlyContinue | Out-Null
                    Invoke-RestMethod -Uri $attckDatasetUrl -OutFile $config.AttckDatasetPath | Out-Null
                    try{
                        Get-Content -Path $config.AttckDatasetPath | ConvertFrom-Json | Write-Output
                    }
                    catch{
                        Set-PSAttckConfiguration -AttckDatasetPath $config.AttckDatasetPath
                        Get-Content -Path $config.AttckDatasetPath | ConvertFrom-Json | Write-Output
                    }
                }
                else{
                    try{
                        Get-Content -Path $config.AttckDatasetPath | ConvertFrom-Json | Write-Output
                    }
                    catch{
                        Set-PSAttckConfiguration -AttckDatasetPath $config.AttckDatasetPath
                        $config
                        Get-Content -Path $config.AttckDatasetPath | ConvertFrom-Json | Write-Output
                    }
                }
            }
        }
        else{
            if ($PSBoundParameters.ContainsKey('AttckJson')){

                Write-Verbose -Message 'Downloading Mitre ATT&CK Json'
                Write-Debug -Message 'Downloading Mitre ATT&CK Json'

                if (-Not(Get-ChildItem -Path $attckJsonPath -ErrorAction SilentlyContinue)){
                    New-Item -Path $attckJsonPath -ItemType File -Force -ErrorAction SilentlyContinue | Out-Null
                    Invoke-RestMethod -Uri $attckJsonUrl -OutFile $attckJsonPath | Out-Null
                    Get-Content -Path $attckJsonPath | ConvertFrom-Json | Write-Output
                }
                else{
                    Get-Content -Path $attckJsonPath | ConvertFrom-Json | Write-Output
                }
                Set-PSAttckConfiguration -AttckJsonPath $attckJsonPath
            }
            else{
                Write-Verbose -Message 'Downloading Mitre ATT&CK dataset Json'
                Write-Debug -Message 'Downloading Mitre ATT&CK dataset Json'

                if (-Not(Get-ChildItem -Path $attckDatasetPath -ErrorAction SilentlyContinue)){
                    New-Item -Path $attckDatasetPath -ItemType File -Force -ErrorAction SilentlyContinue | Out-Null
                    Invoke-RestMethod -Uri $attckDatasetUrl -OutFile $attckDatasetPath | Out-Null
                    Get-Content -Path $attckDatasetPath | ConvertFrom-Json | Write-Output
                }
                else{
                    Get-Content -Path $attckDatasetPath | ConvertFrom-Json | Write-Output
                }
                Set-PSAttckConfiguration -AttckDatasetPath $attckDatasetPath
            }
        }
    }

    end {
    }
}