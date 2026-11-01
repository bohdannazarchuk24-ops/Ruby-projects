puts "Завдання 1: Аргументи за замовчуванням, перевизначення"
def price_with_tax(price, tax = 0.2)
  (price * (1 + tax)).round(2)
end
puts price_with_tax(100)
puts price_with_tax(100, 0.1)

class Product
  def to_s
    "Товар"
  end
end

class Phone < Product
  def to_s                     
    "Телефон (" + super + ")"
  end
end
puts Product.new
puts Phone.new

puts "\nЗавдання 2: Іменовані параметри"
def order(item:, qty: 1, delivery: "самовивіз")
  "#{item} x#{qty}, доставка: #{delivery}"
end
puts order(item: "Мишка")
puts order(item: "Клавіатура", delivery: "Нова пошта", qty: 2)

puts "\nЗавдання 3: Логічні методи"
class Item
  attr_accessor :name, :price, :stock

  def initialize(name, price, stock)
    @name = name
    @price = price
    @stock = stock
  end

  def in_stock?
    stock > 0
  end

  def expensive?
    price > 1000
  end

  def +(other)
    price + other.price
  end

  def <=>(other)
    price <=> other.price
  end

  def stock=(value)
    @stock = [value, 0].max    
  end
end

laptop = Item.new("Ноутбук", 25_000, 3)
mouse  = Item.new("Мишка", 500, 0)
puts laptop.in_stock?
puts mouse.in_stock?
puts laptop.expensive?

puts "\nЗавдання 4: Оператор і присвоювання"
puts laptop + mouse            
puts laptop <=> mouse         
mouse.stock = 10
puts mouse.stock
mouse.stock = -5
puts mouse.stock

puts "\nЗавдання 5: Масив як аргумент"
def total(items)
  items.sum(&:price)
end
def names(*items)
  items.map(&:name).join(", ")
end
puts total([laptop, mouse])
puts names(laptop, mouse)
puts names(*[laptop, mouse])

puts "\nЗавдання 6: Псевдонім"
class Item
  alias_method :cost, :price
end
puts laptop.cost

puts "\nЗавдання 7: Метод-блок із аргументом (&block)"
def each_item(items, &block)
  items.each(&block)
end
each_item([laptop, mouse]) { |i| puts "#{i.name}: #{i.price} грн" }

puts "\nЗавдання 8: yield без аргументу і з аргументом"
def log
  return puts("Блок не передано") unless block_given?
  puts "Початок"
  yield
  puts "Кінець"
end
log { puts "Оформлення замовлення" }
log

def discount(price)
  yield(price)
end
puts discount(1000) { |p| p * 0.9 }

puts "\nЗавдання 9: Proc"
hello = Proc.new { "Ласкаво просимо!" }
puts hello.call

show = Proc.new { |name, price| "#{name || 'nil'}: #{price || 'nil'}" }
puts show.call("Мишка")              
puts show.call("Мишка", 500, "зайве")  

def check_proc
  pr = Proc.new { return "вихід з Proc" }
  pr.call
  "не виконається"
end
puts check_proc                      

puts "\nЗавдання 10: Lambda"
hello = -> { "Ласкаво просимо!" }
puts hello.call

vat = ->(price) { price * 1.2 }
puts vat.call(100)
begin
  vat.call
rescue ArgumentError => e
  puts "Помилка: #{e.message}"
end
begin
  vat.call(1, 2)
rescue ArgumentError => e
  puts "Помилка: #{e.message}"
end

def check_lambda
  l = -> { return "вихід з lambda" }
  r = l.call
  "метод продовжився після: #{r}"
end
puts check_lambda                   