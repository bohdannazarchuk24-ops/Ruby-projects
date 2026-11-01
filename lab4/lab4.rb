puts "Завдання 1: Аргументи за замовчуванням, перевизначення методу"
def greet(name = "Гість", greeting = "Привіт")
  "#{greeting}, #{name}!"
end
puts greet
puts greet("Олена")
puts greet("Олена", "Добрий день")

def greet(name = "Гість")   
  "Вітаю, #{name}!"
end
puts greet
puts greet("Олена")

puts "\nЗадвання 2: Необов'язкові іменовані параметри"
def profile(name:, age: nil, city: "Unknown")
  "#{name}, вік: #{age || 'невідомо'}, місто: #{city}"
end
puts profile(name: "Іван")
puts profile(name: "Іван", city: "Львів", age: 20)

puts "\nЗавдання 3: Логічні (предикатні) методи"
def adult?(age)
  age >= 18
end
def empty_name?(name)
  name.to_s.strip.empty?
end
puts adult?(20)
puts adult?(15)
puts empty_name?("  ")

puts "\nЗавдання 4: Методи-оператори і методи присвоювання"
class Point
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def +(other)                 
    Point.new(x + other.x, y + other.y)
  end

  def ==(other)
    x == other.x && y == other.y
  end

  def x=(value)                
    @x = value
  end

  def to_s
    "(#{x}, #{y})"
  end
end

a = Point.new(1, 2)
b = Point.new(3, 4)
puts a + b
puts a == Point.new(1, 2)
a.x = 10
puts a

puts "\nЗавдання 5: Метод із масивом в якості аргументу"
def sum_all(numbers)
  numbers.sum
end
def sum_args(*numbers)         
  numbers.sum
end
puts sum_all([1, 2, 3])
puts sum_args(1, 2, 3)
puts sum_args(*[4, 5, 6])      

puts "\nЗавдання 6: Псевдонім методу"
def square(n)
  n * n
end
alias kvadrat square
puts square(5)
puts kvadrat(5)

puts "\nЗавдання 7: Метод-блок із аргументом (&block)"
def repeat(times, &block)
  times.times(&block)
end
repeat(3) { |i| puts "Крок #{i + 1}" }

def run_block(&block)
  block.call(5)
end
puts run_block { |n| n * 2 }

puts "\nЗавдання 8: yield без аргументу і з аргументом"
def twice
  return "Блок не передано" unless block_given?   
  yield
  yield
end
twice { puts "Привіт!" }
puts twice

def apply(n)
  yield(n)
end
puts apply(4) { |x| x * x }

puts "\nЗавдання 9: Proc"
no_args = Proc.new { "Proc без аргументів" }
puts no_args.call

add = Proc.new { |a, b| "a=#{a.inspect}, b=#{b.inspect}" }
puts add.call(1)               
puts add.call(1, 2, 3)         
puts add.call([7, 8])          

def proc_return
  pr = Proc.new { return "return з Proc" }
  pr.call
  "ця стрічка не виконається"
end
puts proc_return           

puts "\nЗавдання 10: Lambda"
no_args = -> { "Lambda без аргументів" }
puts no_args.call

sum = ->(a, b) { a + b }
puts sum.call(1, 2)
begin
  sum.call(1)                 
rescue ArgumentError => e
  puts "Помилка: #{e.message}"
end
begin
  sum.call(1, 2, 3)           
rescue ArgumentError => e
  puts "Помилка: #{e.message}"
end

def lambda_return
  l = -> { return "return з lambda" }
  result = l.call
  "метод продовжив роботу після: #{result}"
end
puts lambda_return             