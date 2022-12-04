def create_pair(str)
    str.split(",").map { |pair|
        pair.split("-").map { |number|
            number.to_i
        }
    }
end

def one_contains_the_other_or_opposite(pair) : Bool
    e1 = pair[0]
    e2 = pair[1]

    e1_container = (e1[0] <= e2[0]) && (e2[1] <= e1[1])
    e2_container = (e2[0] <= e1[0]) && (e1[1] <= e2[1])

    if e1_container || e2_container
        return true
    else
        return false
    end
end

def they_overlap(pair) : Bool
    e1 = pair[0]
    e2 = pair[1]

    left_of  = e1[1] < e2[0]
    right_of = e2[1] < e1[0]

    overlap = !(left_of || right_of)

    if overlap
        return true
    else
        return false
    end
end

lines = File.read_lines("./input.txt")

puts lines.size

pairs = lines.map { |line| create_pair(line) }

## First part ##

# containers = pairs.map { |pair| one_contains_the_other_or_opposite(pair) }

## Second part ##

containers = pairs.map { |pair| they_overlap(pair) }

score = containers.reduce(0) { |acc, bool|
    if bool
        acc + 1
    else
        acc
    end
}

puts score
