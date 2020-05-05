using module ./PSAttck/class/Enterprise/Enterprise.psm1

class EnterpriseActor : Enterprise {

    [String] $CreatedByReference
    [String] $Revoked
    hidden $attckObj = @()

    [System.Collections.ArrayList] $Dataset = [System.Collections.ArrayList]::new()
    [String] $Country
    [System.Collections.ArrayList] $Operations = [System.Collections.ArrayList]::new()
    [System.Collections.ArrayList] $AttributionLinks = [System.Collections.ArrayList]::new()
    [System.Collections.ArrayList] $KnownTools = [System.Collections.ArrayList]::new()
    [System.Collections.ArrayList] $Targets = [System.Collections.ArrayList]::new()
    [System.Collections.ArrayList] $AdditionalComments = [System.Collections.ArrayList]::new()
    [System.Collections.ArrayList] $ExternalDescription = [System.Collections.ArrayList]::new()
    static hidden $generatedDataSet

    EnterpriseActor($attckObj) : base($attckObj) {

        if (-not([EnterpriseActor]::generatedDataSet)){
            [EnterpriseActor]::generatedDataSet = Get-AttckDataFiles -AttckDataset
        }

        $this.attckObj = $attckObj

        $this.CreatedByReference = $this.SetAttribute($this.attckObj, 'created_by_ref')
        $this.Revoked = $this.SetAttribute($this.attckObj, 'revoked')

        $this.Dataset = $this.GetFilteredDataset()
    }

    [System.Collections.ArrayList] hidden GetFilteredDataset(){
        $countrys = @()
        [EnterpriseActor]::generatedDataSet.actors.ForEach({
            $_ | get-member -MemberType NoteProperty -ErrorAction SilentlyContinue | ForEach-Object {
                $countrys += $_.Name
            }
        })

        $returnObject = [System.Collections.ArrayList]::new()

        $countrys.ForEach({
            $currentCountry = $_
            [EnterpriseActor]::generatedDataSet.actors.$_.actors.ForEach({
                if ($_.names -contains $this.Name){
                    $this.Country = $currentCountry
                    if ($_.operations){
                        $this.Operations.Add($_.operations)
                    }
                    if ($_.links){
                        $this.AttributionLinks.Add($_.links)
                    }
                    if ($_.tools){
                        $this.KnownTools.Add($_.tools)
                    }
                    if ($_.targets){
                        $this.Targets.Add($_.targets)
                    }
                    if ($_.comment){
                        $this.AdditionalComments.Add($_.comment)
                    }
                    if ($_.description){
                        $this.ExternalDescription.Add($_.description)
                    }
                    $returnObject.Add($_)
                }
            })
        })
        return $returnObject
    }

    [System.Collections.ArrayList] Malwares(){
        $returnObject = [System.Collections.ArrayList]::new()

        $malwareObj = @{}
        $global:PSAttckJson.objects.Where{$_.type -eq 'malware'}.ForEach{
            $malwareObj[$_.id] = $_
        }

        [Enterprise]::relationships[$this.Stix].ForEach{
            if ($malwareObj[$_]){
                $returnObject.Add((New-AttckObject -Object $malwareObj[$_] -Type 'EnterpriseMalware'))
            }
        }
        return $returnObject
    }

    [System.Collections.ArrayList] Tools(){
        $returnObject = [System.Collections.ArrayList]::new()

        $toolObj = @{}
        $global:PSAttckJson.objects.Where{$_.type -eq 'tool'}.ForEach{
            $toolObj[$_.id] = $_
        }

        [Enterprise]::relationships[$this.Stix].ForEach{
            if ($toolObj[$_]){
                $returnObject.Add((New-AttckObject -Object $toolObj[$_] -Type 'EnterpriseTool'))
            }
        }
        return $returnObject
    }

    [System.Collections.ArrayList] Techniques(){
        $returnObject = [System.Collections.ArrayList]::new()

        $techniqueObj = @{}
        $global:PSAttckJson.objects.Where{$_.type -eq 'attack-pattern'}.ForEach{
            $techniqueObj[$_.id] = $_
        }

        [Enterprise]::relationships[$this.Stix].ForEach{
            if ($techniqueObj[$_]){
                $returnObject.Add((New-AttckObject -Object $techniqueObj[$_] -Type 'EnterpriseTechnique'))
            }
        }
        return $returnObject
    }
}