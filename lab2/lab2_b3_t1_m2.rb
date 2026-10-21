path = ARGV[0] || "app.log"

count = 0
File.open(path) do |file|
  file.each_line { |line| count += 1 if line.include?("ERROR") }
end
puts "Кількість помилок (ERROR): #{count}"