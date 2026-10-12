cargos = [
  { item: "Ноутбук", weight: 3, fragile: true },
  { item: "Стіл", weight: 20, fragile: false },
  { item: "Скляна ваза", weight: 2, fragile: true },
  { item: "Шафа", weight: 35, fragile: false },
  { item: "Монітор", weight: 5, fragile: true }
]

fragile_weight = cargos
  .select { |cargo| cargo[:fragile] }
  .sum { |cargo| cargo[:weight] }

sorted_cargos = cargos.sort_by { |cargo| -cargo[:weight] }

puts "Загальна вага крихких вантажів: #{fragile_weight} кг"

puts "\nВантажі від найважчого до найлегшого:"
sorted_cargos.each do |cargo|
  puts "#{cargo[:item]} — #{cargo[:weight]} кг, крихкий: #{cargo[:fragile]}"
end
