def show(pairs)
  puts pairs.map { |name, size| "  #{name} - #{size || 'не задано'} МБ" }
end

# Завдання 1
names = %w[sunset.jpg portrait.png cat.jpg mountains.raw city_night.jpg
           beach.png forest.jpg family.jpg dog.png street.jpg]
sizes = [3.2, 5.1, 2.4, 24.8, 4.7, 6.3, 3.9, 0, 1.8, nil]
photos = names.zip(sizes).to_h
puts "Завдання 1: початковий хеш"
show(photos)

# Завдання 2 
puts "\nЗавдання 2: індексний масив"
p photos.keys.zip(photos.values)

# Завдання 3 
puts "\nЗавдання 3: сортування. 1 - за назвою, 2 - за розміром"
print "Ваш вибір: "
sorted = gets.to_i == 1 ? photos.sort : photos.sort { |a, b| a[1].to_f <=> b[1].to_f }
show(sorted)

# Завдання 4 
puts "\nЗавдання 4: 3 найкоротші назви"
show(photos.sort_by { |name, _| name.length }.first(3))

# Завдання 5 
puts "\nЗавдання 5: 5 найменших ненульових розмірів"
show(photos.select { |_, size| size.to_f > 0 }.sort_by { |_, size| size }.first(5))

# Завдання 6 
print "\nЗавдання 6: введіть назву фотографії: "
query = gets.chomp
found = photos.find { |name, _| name == query }
puts found ? "Розмір: #{found[1] || 'не задано'} МБ" : "Фотографію не знайдено"

# Завдання 7 
puts "\nЗавдання 7: загальний розмір = #{photos.values.compact.sum.round(2)} МБ"

# Завдання 8 
puts "\nЗавдання 8: фотографії без розміру або з нульовим розміром"
photos.select { |_, size| size.to_f.zero? }.each_key do |name|
  print "  Введіть розмір для #{name}: "
  photos[name] = gets.to_f
end
puts "Оновлений хеш:"
show(photos)