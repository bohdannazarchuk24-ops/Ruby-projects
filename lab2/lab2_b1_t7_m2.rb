arr = [3, -2, 5, 0, -7, 4, -7, 9]
min = arr.min
puts "Вхідний масив: #{arr}"

res = arr.map { |x| x > 0 ? min : x }
puts "Результат: #{res}"