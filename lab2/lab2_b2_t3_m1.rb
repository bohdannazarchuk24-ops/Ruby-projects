matrix = [
  [5, 1, 3],
  [9, 4, 7],
  [2, 8, 6],
  [9, 0, 1]
]
max = matrix.flatten.max
puts "Максимум: #{max}"

res = matrix.map(&:dup)
i = 0
while i < res.size
  res[i].sort! if res[i].include?(max)
  i += 1
end
res.each { |row| puts row.inspect }