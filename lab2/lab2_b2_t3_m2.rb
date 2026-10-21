matrix = [
  [5, 1, 3],
  [9, 4, 7],
  [2, 8, 6],
  [9, 0, 1]
]
max = matrix.flatten.max
puts "Максимум: #{max}"

res = matrix.map { |row| row.include?(max) ? row.sort : row }
res.each { |row| puts row.inspect }