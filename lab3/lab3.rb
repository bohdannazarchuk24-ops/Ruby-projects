def show(hash)
  hash.each { |name, size| puts "  #{name} - #{size || 'не задано'} МБ" }
end

# Завдання 1 
photos = {
  "sunset.jpg"     => 3.2,
  "portrait.png"   => 5.1,
  "cat.jpg"        => 2.4,
  "mountains.raw"  => 24.8,
  "city_night.jpg" => 4.7,
  "beach.png"      => 6.3,
  "forest.jpg"     => 3.9,
  "family.jpg"     => 0,    
  "dog.png"        => 1.8,
  "street.jpg"     => nil   
}
puts "Завдання 1: початковий хеш"
show(photos)

# Завдання 2 
puts "\nЗавдання 2: індексний масив"
p photos.to_a

# Завдання 3 
puts "\nЗавдання 3: сортування. 1 - за назвою, 2 - за розміром"
print "Ваш вибір: "
sorted = if gets.to_i == 1
           photos.sort_by { |name, _| name }
         else
           photos.sort_by { |_, size| size.to_f }
         end
show(sorted.to_h)

# Завдання 4 
puts "\nЗавдання 4: 3 найкоротші назви"
show(photos.min_by(3) { |name, _| name.length }.to_h)

# Завдання 5 
puts "\nЗавдання 5: 5 найменших ненульових розмірів"
nonzero = photos.reject { |_, size| size.to_f.zero? }
show(nonzero.min_by(5) { |_, size| size }.to_h)

# Завдання 6 
print "\nЗавдання 6: введіть назву фотографії: "
name = gets.chomp
if photos.key?(name)
  puts "Розмір: #{photos[name] || 'не задано'} МБ"
else
  puts "Фотографію не знайдено"
end

# Завдання 7 
total = photos.sum { |_, size| size.to_f }
puts "\nЗавдання 7: загальний розмір = #{total.round(2)} МБ"

# Завдання 8 
puts "\nЗавдання 8: фотографії без розміру або з нульовим розміром"
photos.each do |name, size|
  next if size.to_f > 0
  print "  Введіть розмір для #{name}: "
  photos[name] = gets.to_f
end
puts "Оновлений хеш:"
show(photos)