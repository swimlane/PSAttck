using module ./PSAttck/Class/Enterprise/Enterprise.psm1

class EnterpriseTechnique : Enterprise {

    [String] $CreatedByReference
    [System.Collections.ArrayList] $Platform
    [System.Collections.ArrayList] $Permission
    [System.Collections.ArrayList] $Bypass
    [System.Collections.ArrayList] $EffectivePermissions
    [System.Collections.ArrayList] $CommandList
    [System.Collections.ArrayList] $Commands
    [System.Collections.ArrayList] $Queries
    [System.Collections.ArrayList] $RawDatasets
    [System.Collections.ArrayList] $RawDetections
    [String] $Network
    [String] $Remote
    [String] $SystemRequirements
    [String] $Detection
    [System.Collections.ArrayList] $DataSource
    [System.Collections.ArrayList] hidden $phaseNames

    static hidden $generatedDataSet

    EnterpriseTechnique($JsonObject) : base($JsonObject) {

        if (-not([EnterpriseTechnique]::generatedDataSet)){
            [EnterpriseTechnique]::generatedDataSet = Get-AttckDataFiles -AttckDataset
        }

        $this.CreatedByReference = $this.SetAttribute($JsonObject, 'created_by_ref')
        $this.Platform = $this.SetListAttribute($JsonObject, 'x_mitre_platforms')

        $this.Permission = $this.SetListAttribute($JsonObject, 'x_mitre_permissions_required')
        $this.Bypass = $this.SetListAttribute($JsonObject, 'x_mitre_defense_bypassed')
        $this.EffectivePermissions = $this.SetListAttribute($JsonObject, 'x_mitre_effective_permissions')
        $this.Network = $this.SetAttribute($JsonObject, 'x_mitre_network_requirements')
        $this.Remote = $this.SetAttribute($JsonObject, 'x_mitre_remote_support')
        $this.SystemRequirements = $this.SetAttribute($JsonObject, 'x_mitre_system_requirements')
        $this.Detection = $this.SetAttribute($JsonObject, 'x_mitre_detection')
        $this.DataSource = $this.SetListAttribute($JsonObject, 'x_mitre_data_sources')

        $this.SetTactic($JsonObject)

        $this.CommandList = $this.GetFilteredDataset('command_list')
        $this.Commands = $this.GetFilteredDataset('commands')
        $this.Queries = $this.GetFilteredDataset('queries')
        $this.RawDatasets = $this.GetFilteredDataset('parsed_datasets')
        $this.RawDetections = $this.GetFilteredDataset('possible_detections')
    }

    [System.Collections.ArrayList] hidden GetFilteredDataset($attribute){
        $returnObject = [System.Collections.ArrayList]::new()
        [EnterpriseTechnique]::generatedDataSet.techniques.ForEach({
            if ($_.technique_id -eq $this.Id){
                $returnObject.Add($_."$attribute")
            }
        })
        return $returnObject
    }

    [void] hidden SetTactic($obj){
        $returnObject = [System.Collections.ArrayList]::new()

        foreach ($phase in $obj.kill_chain_phases){
            $returnObject.Add($phase.phase_name)
        }
        $this.phaseNames = $returnObject
    }

    [System.Collections.ArrayList] Tactics(){
        $returnObject = [System.Collections.ArrayList]::new()

        $global:PSAttckJson.objects.Where{$_.type -eq 'x-mitre-tactic'}.ForEach{
            foreach ($phase in $this.phaseNames){
                if ($phase.ToLower() -eq $_.x_mitre_shortname){
                    $returnObject.Add((New-AttckObject -Object $_ -Type 'EnterpriseTactic'))
                }
            }
        }
        return $returnObject
    }

    [System.Collections.ArrayList] Actors(){
        $returnObject = [System.Collections.ArrayList]::new()

        $actorObj = @{}
        $global:PSAttckJson.objects.Where{$_.type -eq 'intrusion-set'}.ForEach{
            $actorObj[$_.id] = $_
        }

        [Enterprise]::relationships[$this.Stix].ForEach{
            if ($actorObj[$_]){
                $returnObject.Add((New-AttckObject -Object $actorObj[$_] -Type 'EnterpriseActor'))
            }
        }
        return $returnObject
    }

    [System.Collections.ArrayList] Mitigations(){
        $returnObject = [System.Collections.ArrayList]::new()

        $mitigationObj = @{}
        $global:PSAttckJson.objects.Where{$_.type -eq 'course-of-action'}.ForEach{
            $mitigationObj[$_.id] = $_
        }

        [Enterprise]::relationships[$this.Stix].ForEach{
            if ($mitigationObj[$_]){
                $returnObject.Add((New-AttckObject -Object $mitigationObj[$_] -Type 'EnterpriseMitigation'))
            }
        }
        return $returnObject
    }
}