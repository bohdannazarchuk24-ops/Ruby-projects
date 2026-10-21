leaked = nil
begin
  File.open("report.txt", "w") do |file|
    leaked = file
    file.puts "Звіт"
    file.puts "Рядок 1: усе добре"
    raise "Збій усередині блоку!"
  end
rescue => e
  puts "Виняток: #{e.message}"
end
puts "Файл закрито автоматично? #{leaked.closed?}"
puts "Вміст report.txt:\n#{File.read('report.txt', encoding: 'UTF-8')}"