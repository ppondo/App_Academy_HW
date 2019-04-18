fish_arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octopus(array)
    longest = ''
    array.each do |el1|
        array.each do |el2|
            if el1 > el2
                longest = el1
            end
        end
    end

    longest
end

# p sluggish_octopus(fish_arr)


def dominant_octopus(array)
    return array if array.length < 2

    mid = array.length / 2
    left = dominant_octopus(array.take(mid))
    right = dominant_octopus(array.drop(mid))

    arr = merge_oct(left,right)
end

def merge_oct(left,right)
    prc = Proc.new { |a,b| a.length <=> b.length }
    merged = []

    until left.empty? || right.empty?
        case prc.call(left.first, right.first)
        when -1 
            merged << left.shift
        when 0
            merged << left.shift
        when 1 
            merged << right.shift
        end
    end

    merged.concat(left)
    merged.concat(right)
    merged
end

# p dominant_octopus(fish_arr).last

def clever_octopus(fishes)
    longest = ''

    fishes.each do |fish|
        longest = fish if longest.length < fish.length  
    end

    longest
end

# p clever_octopus(fish_arr)

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
tiles_hash = {"up" => 0, "right-up" => 1 , "right" => 2, "right-down" => 3, "down"=> 4, "left-down"=> 5, "left"=> 6,  "left-up"=> 7 }

def slow_dance(direction, tiles)
    tiles.each do |tile|
        return tiles.index(tile) if direction == tile
    end
end

# p slow_dance('up', tiles_array)

def fast_dance(direction, tiles)
    return tiles[direction]
end

p fast_dance("up", tiles_hash)



