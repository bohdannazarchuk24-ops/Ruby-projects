module Stock
  def in_stock?
    @quantity > 0
  end
end

class Product
  include Stock                      
  attr_accessor :name, :price        
  attr_reader :quantity              

  def initialize(name, price, quantity)   
    @name = name
    @price = price
    @quantity = quantity
  end

  def total(count)                  
    price * count
  end

  def sell(count)                    
    return puts("Недостатньо товару: #{name}") if count > quantity
    @quantity -= count
    puts "Продано #{count} шт. #{name} на суму #{total(count)} грн"
  end

  def info
    "#{name}, #{price} грн, залишок: #{quantity}"
  end
end

class Food < Product
  def initialize(name, price, quantity, expiry)
    super(name, price, quantity)     
    @expiry = expiry
  end

  def info
    super() + ", придатний до #{@expiry}"   
  end
end

class Clothing < Product
  def initialize(name, price, quantity, size)
    super(name, price, quantity)
    @size = size
  end

  def info
    super() + ", розмір #{@size}"
  end

  def total(count)                   
    count >= 3 ? super(count) * 0.9 : super(count)
  end
end

class Electronics < Product
  def initialize(name, price, quantity, warranty)
    super(name, price, quantity)
    @warranty = warranty
  end

  def info
    super() + ", гарантія #{@warranty} міс."
  end
end

milk   = Food.new("Молоко", 40, 10, "10.11.2026")
shirt  = Clothing.new("Футболка", 300, 5, "M")
phone  = Electronics.new("Смартфон", 15000, 2, 12)

milk.price = 45
puts milk.price

def phone.info
  "АКЦІЯ! " + super()
end

[milk, shirt, phone].each { |p| puts p.info }

milk.sell(3)
shirt.sell(3)                        
phone.sell(5)                        
phone.sell(2)
puts phone.in_stock?                 