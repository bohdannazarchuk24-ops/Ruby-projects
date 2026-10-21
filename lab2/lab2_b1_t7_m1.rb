arr = [3, -2, 5, 0, -7, 4, -7, 9]
min = arr.min
puts "Вхідний масив: #{arr}"

res = arr.dup
i = 0
while i < res.size
  res[i] = min if res[i] > 0
  i += 1
end
puts "Результат: #{res}"