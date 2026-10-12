numbers = [8, 3, 12, 5, 1, 10]

min_value = numbers.min
max_value = numbers.max

result = numbers.reject do |number|
  number != min_value && number != max_value
end

puts "Початковий масив: #{numbers}"
puts "Мінімум: #{min_value}"
puts "Максимум: #{max_value}"
puts "Результат: #{result}"
