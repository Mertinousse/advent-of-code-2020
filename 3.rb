
# puts File.readlines('input.txt')
#          .map(&:strip)
#          .each_with_index.map { |row, i| row[(i * 3) % (row.length)] }
#          .count('#')

def tree_count(rows, right, down)
  rows.select.with_index { |_, i| i % down == 0 }
      .each_with_index.map { |row, i| row[(i * right) % (row.length)] }.count('#')
end

rows = File.readlines('input.txt').map(&:strip)
vectors = [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]]

puts vectors.map { |right, down| tree_count(rows, right, down) }.inject(&:*)
