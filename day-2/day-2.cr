lines = File.read_lines "./input.txt"

rounds = lines.map { |line|
    line.split " "
}

## First Part ##

# shape_selected = {
#     "X" => 1,
#     "Y" => 2,
#     "Z" => 3
# }
#
# round_outcome = {
#     ["A", "X"] => 3,
#     ["A", "Y"] => 6,
#     ["A", "Z"] => 0,
#     ["B", "X"] => 0,
#     ["B", "Y"] => 3,
#     ["B", "Z"] => 6,
#     ["C", "X"] => 6,
#     ["C", "Y"] => 0,
#     ["C", "Z"] => 3,
# }
#
# scores = rounds.map { |round|
#     round_outcome[round] + shape_selected[round[1]]
# }

## Second Part ##

round_score = {
    "X" => 0,
    "Y" => 3,
    "Z" => 6
}

shape_selected = {
    "A" => 1,
    "B" => 2,
    "C" => 3
}

shape_to_select = {
    ["A", "X"] => "C",
    ["A", "Y"] => "A",
    ["A", "Z"] => "B",
    ["B", "X"] => "A",
    ["B", "Y"] => "B",
    ["B", "Z"] => "C",
    ["C", "X"] => "B",
    ["C", "Y"] => "C",
    ["C", "Z"] => "A"
}

scores = rounds.map { |round|
    round_score[round[1]] + shape_selected[shape_to_select[round]]
}

total_score = scores.reduce { |acc, i| acc + i }

puts total_score
