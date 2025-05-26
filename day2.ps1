$reports = Get-Content -Path "./data/day2_data.txt"

function Determine-Safety
{
  param (
    $report = @()
  )
  if ($report[0] -lt $report[1])
  {
    for ($i=1; $i -lt $report.Count; $i++)
    {
      if (($report[$i] - $report[$i-1] -le 3) -and ($report[$i] - $report[$i-1] -ge 1))
      {
        $pass
      } else
      {
        return $false
      }

    }
    return $true
  } elseif ($report[0] -gt $report[1])
  {
    for ($i=1; $i -lt $report.Count; $i++)
    {
      if (($report[$i-1] - $report[$i] -le 3) -and ($report[$i-1] - $report[$i] -ge 1))
      {
        $pass
      } else
      {
        return $false
      }

    }

    return $true
  } else
  {
    return $false
  }
}
# $count = ($reports | Where-Object {Determine-Safety($_)}).Count
# $count

$count = 0

foreach ($line in $reports)
{
  $report = $line -split " " -as [int[]]
  if (Determine-Safety($report) -eq $true )
  {
    $count += 1
  }
}
# $report
# $report.GetType()
# $report[0].GetType()
$count
# $report[0]
# $report[1]

# 901 too high
# 12 wrong
# 741 wrong too high

Determine-Safety((7,6,4,2,1)) -eq $true
Determine-Safety((1,2,7,8,9)) -eq $true
Determine-Safety((9,7,6,2,1)) -eq $true
Determine-Safety((1,3,2,4,5)) -eq $true
Determine-Safety((8,6,4,4,1)) -eq $true
Determine-Safety((1,3,6,7,9)) -eq $true

