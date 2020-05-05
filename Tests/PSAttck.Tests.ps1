$separator = [io.Path]::DirectorySeparatorChar
$here = "$(Split-Path (Split-Path -Parent $MyInvocation.MyCommand.Path) -Parent)" + $separator + "PSAttck"



$module = 'PSAttck'


Describe "$module PowerShell Module Tests" {
    
    Context 'Module Setup' {

        It "has the root module $module.psm1" {
            "$here" + $separator + "$module.psm1" | Should exist
        }

        It "has the manifest file $module.psd1" {
            "$here" + $separator + "$module.psd1" | should exist
        }

        It "$module has functions" {
            "$here" + $separator + "Public" + $separator + "*.ps1" | Should exist
        }

        It "$module is valid PowerShell Code" {
            $path = "$here" + $separator + "$module.psm1"
            $psFile = Get-Content -Path $path -ErrorAction Stop
            $errors = $null

            $null = [System.Management.Automation.PSParser]::Tokenize($psFile,[ref]$errors)
            $errors.count | Should be 0
        }
    }


    $pubFunctions = ('Get-Attck',
    'Get-AttckActor',
    'Get-AttckDataFiles',
    'Get-AttckMalware',
    'Get-AttckMitigation',
    'Get-AttckTactic',
    'Get-AttckTechnique',
    'Get-AttckTool',
    'Get-PSAttckConfiguration',
    'New-AttckObject',
    'Set-PSAttckConfiguration')

    $privFunctions = ('Add-ObjectDetail')

    foreach ($function in $pubFunctions)
    {
        Context 'Function Tests' {
            
            It "$function.ps1 should exist" {
                "$here" + $separator + "Public" + $separator + "$function.ps1" | Should Exist
            }

            It "$function.ps1 should have help block" {
                "$here" + $separator + "Public" + $separator + "$function.ps1" | Should -FileContentMatch '<#'
                "$here" + $separator + "Public" + $separator + "$function.ps1" | Should -FileContentMatch '#>'
            }
            
            It "$function.ps1 should have a SYNOPSIS section in the help block" {
                "$here" + $separator + "Public" + $separator + "$function.ps1" | Should -FileContentMatch '.SYNOPSIS'
            }

            It "$function.ps1 should have a DESCRIPTION section in the help block" {
                "$here" + $separator + "Public" + $separator + "$function.ps1" | Should -FileContentMatch '.DESCRIPTION'
            }

            It "$function.ps1 should have a EXAMPLE section in the help block" {
                "$here" + $separator + "Public" + $separator + "$function.ps1" | Should -FileContentMatch '.EXAMPLE'
            }

            It "$function.ps1 should be an advanced function" {
                "$here" + $separator + "Public" + $separator + "$function.ps1" | Should -FileContentMatch 'function'
                "$here" + $separator + "Public" + $separator + "$function.ps1" | Should -FileContentMatch 'CmdLetBinding'
                "$here" + $separator + "Public" + $separator + "$function.ps1" | Should -FileContentMatch 'param'
            }

            It "$function.ps1 should contain Write-Verbose blocks" {
                "$here" + $separator + "Public" + $separator + "$function.ps1" | Should -FileContentMatch 'Write-Verbose'
            }

            It "$function.ps1 is valid PowerShell code" {
                $path = "$here" + $separator + "Public" + $separator + "$function.ps1"
                $psFile = Get-Content -Path $path -ErrorAction Stop
                $errors = $null

                $null = [System.Management.Automation.PSParser]::Tokenize($psFile, [ref]$errors)
                $errors.count | Should be 0
            }
        }#Context Function Tests
    }

    foreach ($function in $privFunctions) {
        Context 'Private Functions' {

            It "$function.ps1 should exist" {
                "$here" + $separator + "Private" + $separator + "$function.ps1" | Should -Exist
            }

            It "$function.ps1 should have help block" {
                "$here" + $separator + "Private" + $separator + "$function.ps1" | Should -FileContentMatch '<#'
                "$here" + $separator + "Private" + $separator + "$function.ps1" | Should -FileContentMatch '#>'
            }
            
            It "$function.ps1 should have a SYNOPSIS section in the help block" {
                "$here" + $separator + "Private" + $separator + "$function.ps1" | Should -FileContentMatch '.SYNOPSIS'
            }

            It "$function.ps1 should have a DESCRIPTION section in the help block" {
                "$here" + $separator + "Private" + $separator + "$function.ps1" | Should -FileContentMatch '.DESCRIPTION'
            }

            It "$function.ps1 should have a EXAMPLE section in the help block" {
                "$here" + $separator + "Private" + $separator + "$function.ps1" | Should -FileContentMatch '.EXAMPLE'
            }

            It "$function.ps1 should be an advanced function" {
                "$here" + $separator + "Private" + $separator + "$function.ps1" | Should -FileContentMatch 'function'
                "$here" + $separator + "Private" + $separator + "$function.ps1" | Should -FileContentMatch 'CmdLetBinding'
                "$here" + $separator + "Private" + $separator + "$function.ps1" | Should -FileContentMatch 'param'
            }

            It "$function.ps1 should contain Write-Verbose blocks" {
                "$here" + $separator + "Private" + $separator + "$function.ps1" | Should -FileContentMatch 'Write-Verbose'
            }

            It "$function.ps1 is valid PowerShell code" {
                $path = "$here" + $separator + "Private" + $separator + "$function.ps1"
                $psFile = Get-Content -Path $path -ErrorAction Stop
                $errors = $null

                $null = [System.Management.Automation.PSParser]::Tokenize($psFile, [ref]$errors)
                $errors.count | Should be 0
            }
        } # Context Private Function Tests
    } # end of foreach
}