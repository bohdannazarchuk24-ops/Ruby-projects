arr = [3, 2, 5, 4, -6, 7]
puts "Вхідний масив: #{arr}"

product = 1
found = false
i = 0
while i < arr.size
  if arr[i].even?
    product *= arr[i]
    found = true
  end
  i += 1
end
puts found ? "Добуток парних: #{product}" : "Парних елементів немає"