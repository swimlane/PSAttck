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

$methods = @('Get-AttckTool', 'Get-AttckTechnique', 'Get-AttckTactic', 'Get-AttckMitigation', 'Get-AttckMalware', 'Get-AttckActor')

foreach ($method in $methods){
    $properties = @('Name', 'Id')
    foreach ($prop in $properties){
        ${"($method)NameScriptBlock"} = {
            param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)
        
            (& $method)."$prop".ForEach({
                "'" + $_ + "'"
            })
        }.GetNewClosure()
        Register-ArgumentCompleter -CommandName $method -ParameterName $prop -ScriptBlock ${"($method)NameScriptBlock"}
    }
}

Export-ModuleMember -Variable PSAttckJson
Export-ModuleMember -Function $Public.Basename
Export-ModuleMember -Function $Private.Basename