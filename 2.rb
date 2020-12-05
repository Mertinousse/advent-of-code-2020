
# puts File.readlines('input.txt')
#          .map { |line| line.match(/(\d+)-(\d+) (\D): (\D+)/).to_a }
#          .select { |_, min, max, char, pwd| pwd.chars.count(char).between?(min.to_i, max.to_i) }
#          .count

puts File.readlines('input.txt')
         .map { |line| line.match(/(\d+)-(\d+) (\D): (\D+)/).to_a }
         .select { |_, first, second, char, pwd| [pwd[first.to_i - 1], pwd[second.to_i - 1]].count(char) == 1 }
         .count
