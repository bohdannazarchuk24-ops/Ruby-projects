matrix = [
  [1, 2, 3, 4],
  [4, 1, 3, 2],
  [5, 6, 9, 9],
  [8, 2, 7, 1]
]

res = matrix.map { |row| row == row.sort ? row.sort : row.shuffle }
res.each { |row| puts row.inspect }