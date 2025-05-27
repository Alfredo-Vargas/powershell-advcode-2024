$reports = Get-Content -Path "./data/day2_data.txt"

function Test-Increasing
{
  param(
    [int[]] $report = @()
  )
  for($i=1; $i -lt $report.Count; $i++)
  {
    if ($report[$i] -le $report[$i-1])
    {
      return $false
    }
  }
  return $true
}

function Test-Decreasing
{
  param(
    [int[]] $report = @()
  )
  for($i=1; $i -lt $report.Count; $i++)
  {
    if ($report[$i] -ge $report[$i-1])
    {
      return $false
    }
  }
  return $true
}

function Test-Step
{
  param(
    [int[]] $report = @()
  )
  for ($i=1; $i -lt $report.Count; $i++) 
  {
    if ((([math]::Abs($report[$i] - $report[$i-1])) -gt 3))
    {
      return $false
    }
  }
  return $true
}

function Assert-Safety
{
  param (
    [int[]] $report = @()
  )
  if ((Test-Increasing($report)) -or (Test-Decreasing($report)))
  {
    if (Test-Step($report))
    {
      return $true
    }
  } else
  {
    return $false
  }
}

function Test-Safety
{
  param (
    $reports
  )
  $count = 0
  foreach ($line in $reports)
  {
    $report = $line -split " " -as [int[]]
    if (Assert-Safety($report) -eq $true )
    {
      $count += 1
    }
  }
  return $count
}

#part 1
Write-Output "The number of safe reports is $(Test-Safety($reports))"


