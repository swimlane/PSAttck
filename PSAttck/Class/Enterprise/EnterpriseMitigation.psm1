using module ./PSAttck/Class/Enterprise/Enterprise.psm1

class EnterpriseMitigation : Enterprise {

    [String] $CreatedByReference

    EnterpriseMitigation($JsonObject) : base($JsonObject) {

        $this.CreatedByReference = $this.SetAttribute($JsonObject, 'created_by_ref')
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