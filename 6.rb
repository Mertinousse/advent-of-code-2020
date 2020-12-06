
groups = [[]]

# File.readlines('input.txt').each do |line|
#   groups << [] && next if line.strip.length.zero?

#   groups.last.concat(line.strip.split(''))
# end

# puts groups.map { |group| group.uniq.length }.inject(&:+)

File.readlines('input.txt').each do |line|
  groups << [] && next if line.strip.length.zero?

  groups.last << line.strip.split('')
end

puts groups.sum { |group| group.inject(&:&).length }
