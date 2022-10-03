function global:Histogram {
    [CmdletBinding()]
    [Alias("hgram")]
    param (
        [Parameter(ValueFromPipeline=$True,ValueFromPipelineByPropertyName=$True)]
        [object[]]$Items,
        [Parameter(Position=1)]
        [string]$Property,
        [ValidateRange(2,[int]::MaxValue)]
        [int]$Scale = 40,
        [char]$Visual = '*',
        [ref]$breakdown_ref,
        [switch]$ShowStats,
        [switch]$Numerical,
        [switch]$Sort,
        [switch]$Descending,
        [switch]$PassThru,
        [ValidateRange(2,20)]
        [int]$BucketsCount=10
        )
begin {
    #if (-not $Items) { throw [System.NullReferenceException] '$Items cannot be null' }
    $breakdown = @()
    
    $_Items = @()

    function Categorical {
        param ($items, $property)

        $agg = @{}

        $item_collection = $items
        if ($property) { 
            $item_collection = $items.$property     
        }
        $total_count = 0
        $item_collection | foreach {
            $total_count++
            if ($agg.ContainsKey($_)) { $agg[$_] += 1 }
            else { $agg.Add($_, 1) }
        }
        $unique_items = $agg.Keys
    
        $breakdown += $unique_items | % { 
            $item_name = $_; 
            $this_item_count = $agg[$item_name]
            if ($this_item_count -eq 0) { $this_item_count = 1 }
            $pcnt = [Math]::Round(($this_item_count / $total_count) * 100, 2)
            New-Object psobject -Property @{"Item"=$item_name; "Count"=$this_item_count; "Percentage"=$pcnt}
        }
    
        $top = $breakdown | measure -Property Percentage -Maximum | select -ExpandProperty Maximum

        $breakdown | % {
            $skew = $_.Percentage/$top
            $bar = "$Visual" * [Math]::Ceiling($Scale * $skew)
            $_ | Add-Member -MemberType NoteProperty -Name Histogram -Value $bar
        }

        if ($Sort) {
            $breakdown = $breakdown | sort Count -Descending:$Descending
        }

        if ($breakdown_ref) {
            $breakdown_ref.Value = $breakdown
        }
        
        if ($ShowStats -and $PassThru -and -not $Verbose) {
            $_verbPre = $VerbosePreference            
            $VerbosePreference = [System.Management.Automation.ActionPreference]::Continue
            Write-Verbose "Total items: $total_count,  Unique items: $($breakdown.Count)"
            $VerbosePreference = $_verbPre        
        }
        if ($ShowStats -and -not $Verbose) {
            Write-Host "Total items: $total_count,  Unique items: $($breakdown.Count)"                
        }
        Write-Verbose "Total items: $total_count,  Unique items: $($breakdown.Count)"

        $breakdown | select Item, Count, Percentage, Histogram
    }

    function Numerical {
        param ($items, $property)
        [double]$min = [double]::MaxValue
        [double]$max = [double]::MinValue
        [double[]]$item_collection = @()
        if ($property) { [double[]]$item_collection = $items | Select-Object -ExpandProperty $property -ErrorAction SilentlyContinue | Where-Object { $_ } }
        else { [double[]]$item_collection = $items}
        $total_count = $item_collection.Count

        $max = [System.Linq.Enumerable]::Max($item_collection)
        $min = [System.Linq.Enumerable]::Min($item_collection)


        $range = 0
        if     ($min -lt 0) { $range = [Math]::Abs($min) + $max }
        elseif ($min -gt 0) { $range = $max - $min }
        elseif ($min -eq 0) { $range = $max - 0.1 }

        $bucket_size = $range / $BucketsCount
        $buckets = New-Object int[] $BucketsCount

        $zero_shift = $min * -1
        foreach ($n in $item_collection) {
            $offset = [Math]::Floor(($n + $zero_shift) / $bucket_size)
            if ($offset -ge $BucketsCount) {
                $offset = $buckets.Count - 1
            }
            $buckets[$offset]++ 
        }
        $num_items = @()
        for ($i=0; $i -lt $BucketsCount; $i++) {
            $num_items += New-Object PSObject -Property @{
                "Bucket"=$([Math]::Round($min + ($bucket_size * ($i+1)), 2));
                "Count"=$buckets[$i]
            }
        }
    
        $breakdown += $num_items | % { 
            $i = $_; 
            $this_item_count = @($item_collection | ? { $_ -like $i }).Count
            if ($this_item_count -eq 0) { $this_item_count = 1 }
            $pcnt = [Math]::Round(($_.Count / $total_count) * 100, 2)
            $_ | Add-Member -MemberType NoteProperty -Name Percentage -Value $pcnt -PassThru
            }
    
        $top = $breakdown | measure -Property Percentage -Maximum | select -ExpandProperty Maximum

        $breakdown | % {
            $skew = $_.Percentage/$top
            $bar = "$Visual" * [Math]::Ceiling($Scale * $skew)
            $_ | Add-Member -MemberType NoteProperty -Name Histogram -Value $bar
        }
    
        if ($breakdown_ref) {
            $breakdown_ref.Value = $breakdown    
        }

        Write-Verbose "Min: $("{0:N2}" -f $min),  Max: $("{0:N2}" -f $max), Bucket Size: $("{0:N2}" -f $bucket_size)  Range: $("{0:N2}" -f $range)"
        if ($ShowStats -and -not $Verbose) {
            Write-Host "Min: $("{0:N2}" -f $min),  Max: $("{0:N2}" -f $max), Bucket Size: $("{0:N2}" -f $bucket_size)  Range: $("{0:N2}" -f $range)"
        }
    
        $breakdown | select Bucket, Count, Percentage, Histogram
    }
}
process {
    $_Items += $Items;
}
end {
    if ($Numerical) { Numerical $_Items $Property }
    else { Categorical $_Items $Property }
}
}

return

<#
Comment the former return statement to run this simple test.
It demonstrates how to generate a histogram from the output
of Get-ChildItem (do it in a directory with lots of files).
cd /usr/local/bin  #change to fit your system
$files = gci
$histogram_data = $null
$files | Histogram 'Length' -Numerical
$files | Histogram 'Mode' -PassThru -ShowStats | Tee-Object -Variable 'histogram_data' | FT -AutoSize
#>
