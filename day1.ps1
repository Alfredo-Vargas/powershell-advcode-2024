$both_lists = Get-Content -Path "./data/day1_data.txt"

$left_list = @()
$right_list = @()

for($i=0; $i -lt $both_lists.Count; $i++)
{
  $line = $both_lists[$i] -split "   "
  $left_list += $line[0]
  $right_list += $line[1]
}

# part 1
$sorted_left_list = $left_list | Sort-Object
$sorted_right_list = $right_list | Sort-Object

$total_distance = 0
for($i=0; $i -lt $both_lists.Count; $i++)
{
  $total_distance += [math]::Abs($sorted_left_list[$i] - $sorted_right_list[$i])
}

"The result of part 1 is: $total_distance"

# part 2
$similarity_score = 0
for($i=0; $i -lt $both_lists.Count; $i++)
{
  $count = ($right_list | Where-Object {$_ -eq $left_list[$i]}).Count
  $similarity_score += $count * $left_list[$i]
}

"The result of part 2 is: $similarity_score"
