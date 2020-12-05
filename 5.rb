
# puts File.readlines('input.txt')
#          .map { |seat| seat.gsub(/F|L/, '0').gsub(/B|R/, '1') }
#          .map { |seat| [seat[0..6].to_i(2), seat[7..9].to_i(2)] }
#          .map { |row, column| row * 8 + column }
#          .max

seats = File.readlines('input.txt')
            .map { |seat| seat.gsub(/F|L/, '0').gsub(/B|R/, '1') }
            .map { |seat| [seat[0..6].to_i(2), seat[7..9].to_i(2)] }
            .map { |row, column| row * 8 + column }
            .sort

puts seats.each_with_index.find { |seat, i| seat + 2 == seats[i + 1] }.first.then { |seat| seat + 1 }
