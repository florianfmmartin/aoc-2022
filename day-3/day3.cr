lines = File.read_lines "./input.txt"

def char_to_priority(char : Char) : Int32
    ascii_value = char.ord

    if ascii_value < 97
        return ascii_value - 38
    else
        return ascii_value - 96
    end
end

def split_string_in_two(string : String) : Tuple(String, String)
    size_of_string = string.size
    half_of_size = (size_of_string / 2).to_i32!
    first_half = Range.new(0, half_of_size - 1)
    second_half = Range.new(half_of_size, size_of_string)

    Tuple.new(string[first_half], string[second_half])
end

def find_same_char(fs : String, ss : String) : Char
    fsca = fs.chars
    ssca = ss.chars

    fsca.each { |fc|
        ssca.each { |sc|
            if fc == sc
                return sc
            end
        }
    }

    raise "OH, NO!"
end

## First Part ##

# rucksacks = lines.map { |line| split_string_in_two(line) }
#
# same_chars = rucksacks.map { |sack|
#     find_same_char(sack[0], sack[1])
# }
#
# scores = same_chars.map { |char| char_to_priority(char) }

## Second Part ##

def split_array_in_groups_of_three(arr : Array) : Array
    ret_arr = [] of Array(String)
    elem_arr = [] of String
    counter = 0

    arr.each { |elem|
        elem_arr << elem

        if counter == 2
            ret_arr << elem_arr
            elem_arr = [] of String
            counter = 0
        else
            counter += 1
        end
    }

    ret_arr
end

def find_same_char_thrice(fs : String, ss : String, ts : String) : Char
    fsca = fs.chars
    ssca = ss.chars
    tsca = ts.chars

    fsca.each { |fc|
        ssca.each { |sc|
            if fc == sc
                tsca.each { |tc|
                    if sc == tc
                        return tc
                    end
                }
            end
        }
    }

    raise "OH, NO!"
end

groups = split_array_in_groups_of_three(lines)

groups_chars = groups.map { |group| find_same_char_thrice(group[0], group[1], group[2]) }

scores = groups_chars.map { |char| char_to_priority(char) }

puts scores.sum
