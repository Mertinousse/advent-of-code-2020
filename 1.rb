
puts File.readlines('input.txt')
         .map(&:to_i)
         .combination(3)
         .find { |numbers| numbers.inject(&:+) == 2020 }
         .then { |numbers| numbers.inject(&:*) }
