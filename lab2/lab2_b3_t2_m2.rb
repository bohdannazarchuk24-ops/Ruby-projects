file = nil
begin
  file = File.open("report.txt", "w")
  file.puts "Звіт (ручний режим)"
  file.puts "Рядок 1: усе добре"
  raise "Збій без блоку!"
rescue => e
  puts "Виняток: #{e.message}"
ensure
  file&.close
end
puts "Файл закрито через ensure? #{file.closed?}"
puts "Вміст report.txt:\n#{File.read('report.txt', encoding: 'UTF-8')}"