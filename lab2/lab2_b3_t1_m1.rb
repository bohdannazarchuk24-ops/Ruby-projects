path = ARGV[0] || "app.log"

count = 0
File.foreach(path) { |line| count += 1 if line.include?("ERROR") }
puts "Кількість помилок (ERROR): #{count}"