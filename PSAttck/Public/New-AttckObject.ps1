<#
.SYNOPSIS
    Creates a new PSAttck Object and should NOT be used externally
.DESCRIPTION
    Creates a new PSAttck Object and should NOT be used externally.

    This function is currently public since there is a limitation in which PowerShell Classes cannot access private (non-exported) functions
.PARAMETER Object
    A JSON Object from PSAttck Classes
.PARAMETER Type
    Used to filter and set a specify object type to create
.EXAMPLE
    (New-AttckObject -Object $mitigationObj[$_] -Type 'EnterpriseMitigation')
.OUTPUTS
    PSAttck.Enterprise.Actor
    PSAttck.Enterprise.Malware
    PSAttck.Enterprise.Mitigation
    PSAttck.Enterprise.Tactic
    PSAttck.Enterprise.Technique
    PSAttck.Enterprise.Tool
#>
function New-AttckObject {
    [CmdletBinding(DefaultParameterSetName='Parameter Set 1',
                   PositionalBinding=$false,
                   HelpUri = 'http://www.microsoft.com/',
                   ConfirmImpact='Medium')]
    Param (
        # Param1 help description
        [Parameter(Mandatory=$true,
                   Position=0,
                   ValueFromPipeline=$true,
                   ParameterSetName='Parameter Set 1')]
        $Object,

        # Param2 help description
        [Parameter(Mandatory=$true,
                   Position=1,
                   ValueFromPipeline=$true,
                   ParameterSetName='Parameter Set 1')]
        [ValidateSet('EnterpriseActor','EnterpriseMalware','EnterpriseMitigation', 'EnterpriseTactic', 'EnterpriseTechnique', 'EnterpriseTool')]
        $Type
    )

    begin {
        Write-Verbose -Message 'Creating new Attck Object'
    }

    process {
        switch ($Type) {
            'EnterpriseActor' {return [EnterpriseActor]::new($Object)}
            'EnterpriseMalware' {return [EnterpriseMalware]::new($Object)}
            'EnterpriseMitigation' {return [EnterpriseMitigation]::new($Object)}
            'EnterpriseTactic' {return [EnterpriseTactic]::new($Object)}
            'EnterpriseTechnique' {return [EnterpriseTechnique]::new($Object)}
            'EnterpriseTool' {return [EnterpriseTool]::new($Object)}
        }
    }

    end {
    }
}