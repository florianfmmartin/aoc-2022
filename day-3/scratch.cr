s1 = "abcdzg"
s2 = "florin"

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

puts find_same_char(s1, s2)
