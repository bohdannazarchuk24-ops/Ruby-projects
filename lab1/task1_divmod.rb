print "Введіть кількість днів: "
days = gets.to_i

weeks, remaining_days = days.divmod(7)

puts "Повних тижнів: #{weeks}"
puts "Залишилося днів: #{remaining_days}"
