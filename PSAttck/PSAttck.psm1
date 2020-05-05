#Get public and private function definition files.
$Public  = @( Get-ChildItem -Path $PSScriptRoot\Public\*.ps1 -Recurse -ErrorAction SilentlyContinue )
$Private = @( Get-ChildItem -Path $PSScriptRoot\Private\*.ps1 -Recurse -ErrorAction SilentlyContinue )

#Dot source the files
Foreach($import in @($Public + $Private))
{
    Try
    {
        . $import.fullname
    }
    Catch
    {
        Write-Error -Message "Failed to import function $($import.fullname): $_"
    }
}

$PSAttckJson = Get-AttckDataFiles -AttckJson

$attckFilterByScriptBlock = {
    param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)

    if ($fakeBoundParameters.ContainsKey('Actor')){
        (Get-AttckActor | Get-Member -MemberType Properties | Select-Object Name).ForEach({
            $_.Name
        })
    }
    if ($fakeBoundParameters.ContainsKey('Malware')){
        (Get-AttckMalware | Get-Member -MemberType Properties | Select-Object Name).ForEach({
            $_.Name
        })
    }
    if ($fakeBoundParameters.ContainsKey('Tactic')){
        (Get-AttckTactic | Get-Member -MemberType Properties | Select-Object Name).ForEach({
            $_.Name
        })
    }
    if ($fakeBoundParameters.ContainsKey('Technique')){
        (Get-AttckTechnique | Get-Member -MemberType Properties | Select-Object Name).ForEach({
            $_.Name
        })
    }
    if ($fakeBoundParameters.ContainsKey('Tool')){
        (Get-AttckTool | Get-Member -MemberType Properties | Select-Object Name).ForEach({
            $_.Name
        })
    }
}

Register-ArgumentCompleter -CommandName Get-Attck -ParameterName FilterBy -ScriptBlock $attckFilterByScriptBlock


$attckFilterValueScriptBlock = {
    param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)

    if ($fakeBoundParameters.ContainsKey('FilterBy')){
        if ($fakeBoundParameters.ContainsKey('Actor')){
            (Get-AttckActor).$($fakeBoundParameters['FilterBy']).ForEach({
                "'" + $_ + "'"
            })
        }
        if ($fakeBoundParameters.ContainsKey('Malware')){
            (Get-AttckMalware).$($fakeBoundParameters['FilterBy']).ForEach({
                "'" + $_ + "'"
            })
        }
        if ($fakeBoundParameters.ContainsKey('Tactic')){
            (Get-AttckTactic).$($fakeBoundParameters['FilterBy']).ForEach({
                "'" + $_ + "'"
            })
        }
        if ($fakeBoundParameters.ContainsKey('Technique')){
            (Get-AttckTechnique).$($fakeBoundParameters['FilterBy']).ForEach({
                "'" + $_ + "'"
            })
        }
        if ($fakeBoundParameters.ContainsKey('Tool')){
            (Get-AttckTool).$($fakeBoundParameters['FilterBy']).ForEach({
                "'" + $_ + "'"
            })
        }
    }
}

Register-ArgumentCompleter -CommandName Get-Attck -ParameterName Value -ScriptBlock $attckFilterValueScriptBlock

$AttckActorScriptBlock = {
    param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)

    (Get-AttckActor).Name.ForEach({
        "'" + $_ + "'"
    })
}

Register-ArgumentCompleter -CommandName Get-AttckActor -ParameterName Name -ScriptBlock $AttckActorScriptBlock

$AttckMalwareScriptBlock = {
    param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)

    (Get-AttckMalware).Name.ForEach({
        "'" + $_ + "'"
    })
}

Register-ArgumentCompleter -CommandName Get-AttckMalware -ParameterName Name -ScriptBlock $AttckMalwareScriptBlock

$AttckMitigationScriptBlock = {
    param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)

    (Get-AttckMitigation).Name.ForEach({
        "'" + $_ + "'"
    })
}

Register-ArgumentCompleter -CommandName Get-AttckMitigation -ParameterName Name -ScriptBlock $AttckMitigationScriptBlock

$AttckTacticScriptBlock = {
    param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)

    (Get-AttckTactic).Name.ForEach({
        "'" + $_ + "'"
    })
}

Register-ArgumentCompleter -CommandName Get-AttckTactic -ParameterName Name -ScriptBlock $AttckTacticScriptBlock

$AttckTechniqueScriptBlock = {
    param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)

    (Get-AttckTechnique).Name.ForEach({
        "'" + $_ + "'"
    })
}

Register-ArgumentCompleter -CommandName Get-AttckTechnique -ParameterName Name -ScriptBlock $AttckTechniqueScriptBlock

$attckToolScriptBlock = {
    param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)

    (Get-AttckTool).Name.ForEach({
        "'" + $_ + "'"
    })
}

Register-ArgumentCompleter -CommandName Get-AttckTool -ParameterName Name -ScriptBlock $attckToolScriptBlock


Export-ModuleMember -Variable PSAttckJson
Export-ModuleMember -Function $Public.Basename
Export-ModuleMember -Function $Private.Basename