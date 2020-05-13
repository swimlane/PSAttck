class PSAttck {
}

class Enterprise : PSAttck  {
    [String] $Id
    [String] $Name
    [String] $Aliases
    [String] $Description
    [PSCustomObject] $Reference
    [String] $Created
    [String] $Modified
    [String] $Stix
    [String] $Type
    [String] $Wiki
    [String] $Contributor

    static $relationships

    Enterprise($attckObj) : base() {

        if (-not([Enterprise]::relationships)){
            $relationshipObj = @{}
            $Global:PSAttckJson.objects.Where{$_.type -eq 'relationship'}.ForEach{
                $sourceID = $_.source_ref
                $targetID = $_.target_ref
                if(-not $relationshipObj.ContainsKey($sourceID)){
                    $relationshipObj[$sourceID] = @()
                }
                $relationshipObj[$sourceID] += $targetID

                if(-not $relationshipObj.ContainsKey($targetID)){
                    $relationshipObj[$targetID] = @()
                }
                $relationshipObj[$targetID] += $sourceID
                [Enterprise]::relationships = $relationshipObj
            }
        }

        $this.Id   = $this.SetIdAttribute($attckObj)
        $this.Name = $this.SetAttribute($attckObj,'name')
        $this.Aliases = $this.SetListAttribute($attckObj, 'aliases')
        $this.Description = $this.SetAttribute($attckObj, 'description')
        $this.Reference = $this.SetReferenceAttribute($attckObj)
        $this.Created = $this.SetDateTimeAttribute($attckObj, 'created')
        $this.Modified = $this.SetDateTimeAttribute($attckObj, 'modified')
        $this.Stix = $this.SetAttribute($attckObj, 'id')
        $this.Type = $this.SetAttribute($attckObj, 'type')
        $this.Wiki = $this.SetWikiAttribute($attckObj)
        $this.Contributor = $this.SetListAttribute($attckObj, 'x_mitre_contributors')
    }

    [String] hidden SetIdAttribute($obj){
        try {
            foreach ($ref in $obj.external_references){
                if ($ref.source_name -eq 'mitre-attack'){
                    return $ref.external_id
                }
                else{
                    return 'no external_id found'
                }
            }
        }
        catch {
            Write-Error -ErrorRecord $Error[0] -RecommendedAction 'Unable to set Mitre ATT&CK ID Attribute'
        }
        return $null
    }

    [System.Collections.ArrayList] hidden SetListAttribute ($obj, [string] $name){
        $returnObject = [System.Collections.ArrayList]::new()
        if ($obj."$name"){
            foreach ($item in $obj."$name"){
                $returnObject.Add($item)
            }
        }
        return $returnObject
    }

    [String] hidden SetAttribute ($obj, [string] $name){
        if ($obj.PSobject.Properties.name -match $name){
            $tempObj = $obj | Select-Object -Property $name
            if ($tempObj.PSobject.Properties.name -match 'name'){
                return $tempObj."$name"
            }
            else{
                return $obj."$name"
            }
        }
        else{
            return "No $name attribute found"
        }
    }

    [string] hidden SetDateTimeAttribute($obj, $name){
        if ($obj -and $obj.name){
            $tempObject = $obj | Select-Object -Property $name
            return [datetime]$tempObject.$name
        }
        else{
            return "No value for $name property"
        }
    }

    [String] hidden SetWikiAttribute($obj){
        try {
            foreach ($ref in $obj.external_references){
                if ($ref.source_name -eq 'mitre-attack'){
                    return $ref.url
                }
                else{
                    return 'No url attribute found'
                }
            }
        }
        catch {
            Write-Error -ErrorRecord $Error[0] -RecommendedAction 'Unable to set Mitre ATT&CK url Attribute'
        }
        return $null
    }

    [PSCustomObject] hidden SetReferenceAttribute($obj){

        $ReturnObject = @()
        $extId       = ''
        $url         = ''
        $sourceName  = ''
        $descr       = ''

        try {
            foreach ($ref in $obj.external_references){
                foreach ($attr in $ref){
                    if ($attr.external_id){
                        $extId = $attr.external_id
                    }
                    else {
                        $extId = 'No external_id attribute found'
                    }
                    if ($attr.url){
                        $url = $attr.url
                    }
                    else {
                        $url = 'No url attribute found'
                    }
                    if ($attr.source_name){
                        $sourceName = $attr.source_name
                    }
                    else {
                        $sourceName = 'No source_name attribute found'
                    }
                    if ($attr.description){
                        $descr = $attr.description
                    }
                    else {
                        $descr = 'No description attribute found'
                    }

                $props = @{
                    ExternalId  = $extId
                    Url         = $url
                    SourceName  = $sourceName
                    Description = $descr
                }

                $tempObject = New-Object -TypeName PSCustomObject -Property $props
                $ReturnObject += $tempObject
                }
            }
            return $ReturnObject
        }
        catch {
            Write-Error -ErrorRecord $Error[0] -RecommendedAction 'Unable to set Mitre ATT&CK url Attribute'
        }
        return $null
    }
}


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


class EnterpriseMalware : Enterprise {

    [String] $CreatedByReference
    [String] $Revoked
    [System.Collections.ArrayList] $Label
    [System.Collections.ArrayList] $Platform

    EnterpriseMalware($JsonObject) : base($JsonObject) {

        $this.Label = $this.SetListAttribute($JsonObject, 'labels')
        $this.Platform = $this.SetListAttribute($JsonObject, 'x_mitre_platforms')
        $this.CreatedByReference = $this.SetAttribute($JsonObject, 'created_by_ref')
        $this.Revoked = $this.SetAttribute($JsonObject, 'revoked')
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


class EnterpriseTool : Enterprise {

    [System.Collections.ArrayList] $C2Matrix = [System.Collections.ArrayList]::new()
    [System.Collections.ArrayList] $ToolsDataset = [System.Collections.ArrayList]::new()
    [System.Collections.ArrayList] $AdditionalNames = [System.Collections.ArrayList]::new()
    [System.Collections.ArrayList] $AttributionLinks = [System.Collections.ArrayList]::new()
    [System.Collections.ArrayList] $Family = [System.Collections.ArrayList]::new()
    [System.Collections.ArrayList] $AdditionalComments = [System.Collections.ArrayList]::new()
    ${Actively Maint.}
    $Agent
    $API
    ${ATT&CK Mapping}
    $Chaining
    ${Custom Profile}
    $Dashboard
    $Date
    $DNS
    $DoH
    $DomainFront
    $Evaluator
    $FTP
    ${GH Issues}
    $GitHub
    ${How-To}
    $HTTP
    $HTTP2
    $HTTP3
    $ICMP
    $IMAP
    $Implementation
    $Jitter
    $Kali
    ${Key Exchange}
    ${Kill Date}
    $License
    $Linux
    $Logging
    $macOS
    $MAPI
    ${Multi-User}
    $c2Name
    $Notes
    $Price
    ${Proxy Aware}
    $Server
    $Site
    $Slack
    ${Slack Members}
    $SMB
    $Stego
    $TCP
    $Twitter
    $UI
    ${Version Reviewed}
    $Windows
    ${Working Hours}
    $NetWitness
    static hidden $generatedDataSet


    EnterpriseTool($JsonObject) : base($JsonObject) {
        if (-not([EnterpriseTool]::generatedDataSet)){
            [EnterpriseTool]::generatedDataSet = Get-AttckDataFiles -AttckDataset
        }

        $this.C2Matrix = $this.GetC2Dataset()
        $this.ToolsDataset = $this.GetToolsDataset()
    }

    [System.Collections.ArrayList] hidden GetToolsDataset(){
        $returnObject = [System.Collections.ArrayList]::new()

        [EnterpriseTool]::generatedDataSet.tools.tools.ForEach({
            if ($this.Name -in $_.names -or $this.Aliases -in $_.names){
                $returnObject.Add($_)
                foreach ($item in $_.names){
                    $this.AdditionalNames.Add($item)
                }
                foreach ($item in $_.links){
                    $this.AttributionLinks.Add($item)
                }
                foreach ($item in $_.family){
                    $this.Family.Add($item)
                }
                foreach ($item in $_.comments){
                    $this.AdditionalComments.Add($item)
                }
            }
        })
        return $returnObject
    }

    [System.Collections.ArrayList] hidden GetC2Dataset(){
        $returnObject = [System.Collections.ArrayList]::new()
      
        $tools = @()
        [EnterpriseTool]::generatedDataSet.c2_data.ForEach({
            $tools += ($_ | Get-Member -MemberType NoteProperty | Select-Object Name).Name
        })

        $tools.ForEach({
            $currentTool = $_
            if ($_ -match $this.Name -or $_ -in $this.Aliases){
                $props = @()
                [EnterpriseTool]::generatedDataSet.c2_data.$_.ForEach({
                    ($_ | Get-Member -MemberType NoteProperty | Select-Object Name).Name.ForEach({
                        $props += $_
                    # $_
                    })
                    if ($props){
                        foreach ($item in $props){
                            if ($item -eq 'Name'){
                                $this.$('c2'+$item) = $_.$item
                            }
                            try{
                                $this.$($item) = $_.$item
                            }
                            catch{
                                Write-Debug -Message "Unable to find property $item but ignoring for now"
                            }
                        }
                    $returnObject.Add($_)
                    }
                })
            }
        })
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