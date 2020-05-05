using module ./PSAttck/Class/Enterprise/Enterprise.psm1

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
                           $this.$($item) = $_.$item
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