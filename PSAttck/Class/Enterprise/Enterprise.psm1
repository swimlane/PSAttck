using module ./PSAttck/Class/PSAttck.psm1

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
