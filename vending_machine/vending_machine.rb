class Suica
  def initialize
    @balance = 500
  end
  def charge(charge_amount)
    if charge_amount < 100
      false
    else
      @balance += charge_amount
      true
    end
  end

  def amount
    @balance
  end
end

class VenderMachine
  PRODUCTS = ['ペプシ']
  PRICE = [150]
  def initialize
    @stocks = {0 => 5}
  end

  def check_stock(product)
    @stocks[0]
  end
  def able_to_buy?(suica,juice)
    if suica.amount > juice.price && @stocks[0] > 0
      true
    else
      false
    end

  end
end

class Juice
  def initialize(name, price)
    @name = name
    @price = price
  end
end


test_vender1 = VenderMachine.new()
test1 = Suica.new()

puts test1.amount
puts test1.charge(300)
puts test1.amount
puts test_vender1.check_stock()
