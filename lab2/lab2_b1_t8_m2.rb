arr = [3, 2, 5, 4, -6, 7]
puts "Вхідний масив: #{arr}"

evens = arr.select(&:even?)
puts evens.empty? ? "Парних елементів немає" : "Добуток парних: #{evens.reduce(:*)}"