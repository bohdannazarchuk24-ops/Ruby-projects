module Sellable                      
  def sell(count)
    if count > @quantity
      puts "Недостатньо товару: #{@name}"
    else
      @quantity -= count
      puts "Продано #{count} шт. #{@name} на суму #{total(count)} грн"
    end
  end
end

class Product
  include Sellable
  attr_accessor :name, :price
  attr_reader :quantity

  VAT = 0.2                          
  @@count = 0                        

  def self.count                     
    @@count
  end

  def initialize(options = {})       
    @name = options[:name]
    @price = options[:price]
    @quantity = options[:quantity]
    @@count += 1
  end

  def total(count)                   
    with_vat * count
  end

  def info
    "#{@name}, #{@price} грн, залишок: #{@quantity}"
  end

  private                            

  def with_vat
    @price * (1 + VAT)
  end
end

class Food < Product
  def initialize(options)
    super                            
    @expiry = options[:expiry]
  end

  def info
    "#{super} (до #{@expiry})"
  end
end

class Clothing < Product
  def initialize(options)
    super
    @size = options[:size]
  end

  def info
    "#{super} (розмір #{@size})"
  end

  def total(count)                   
    count >= 3 ? super * 0.9 : super
  end
end

class Electronics < Product
  def initialize(options)
    super
    @warranty = options[:warranty]
  end

  def info
    "#{super} (гарантія #{@warranty} міс.)"
  end
end

milk  = Food.new(name: "Молоко", price: 40, quantity: 10, expiry: "10.11.2026")
shirt = Clothing.new(name: "Футболка", price: 300, quantity: 5, size: "M")
phone = Electronics.new(name: "Смартфон", price: 15000, quantity: 2, warranty: 12)

def shirt.info
  "РОЗПРОДАЖ! " + super
end

[milk, shirt, phone].each { |p| puts p.info }

milk.sell(3)
shirt.sell(3)
phone.sell(5)
puts "Створено товарів: #{Product.count}"