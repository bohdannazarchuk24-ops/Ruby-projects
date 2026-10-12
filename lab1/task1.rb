print "Введіть кількість днів: "
days = gets.to_i

weeks = days / 7
remaining_days = days % 7

puts "Повних тижнів: #{weeks}"
puts "Залишилося днів: #{remaining_days}"