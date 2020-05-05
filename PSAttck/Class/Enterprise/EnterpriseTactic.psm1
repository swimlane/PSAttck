using module ./PSAttck/Class/Enterprise/Enterprise.psm1

class EnterpriseTactic : Enterprise {

    [String] $CreatedByReference
    [String] $ShortName

    EnterpriseTactic($JsonObject) : base($JsonObject) {

        $this.ShortName = $this.SetAttribute($JsonObject, 'x_mitre_shortname')
        $this.CreatedByReference = $this.SetAttribute($JsonObject, 'created_by_ref')
    }

    [System.Collections.ArrayList] Techniques(){
        $returnObject = [System.Collections.ArrayList]::new()

        $global:PSAttckJson.objects.ForEach{
            if ($_.kill_chain_phases){
                foreach ($name in $_.kill_chain_phases){
                    if ($name.phase_name.ToLower() -eq $this.ShortName){
                        $returnObject.Add((New-AttckObject -Object $_ -Type 'EnterpriseTechnique'))
                    }
                }
            }
        }
        return $returnObject
    }
}