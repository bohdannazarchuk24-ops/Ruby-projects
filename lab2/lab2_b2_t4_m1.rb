matrix = [
  [1, 2, 3, 4],
  [4, 1, 3, 2],
  [5, 6, 9, 9],
  [8, 2, 7, 1]
]

res = []
i = 0
until i == matrix.size
  row = matrix[i]
  res << (row == row.sort ? row.sort : row.shuffle)
  i += 1
end
res.each { |row| puts row.inspect }