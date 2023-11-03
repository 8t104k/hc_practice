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

  def buy(price)
    @balance -= price
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
    @sales = 0
  end

  def check_stock(product)
    i = PRODUCTS.index(product)
    @stocks[i]
  end
  def able_to_buy?(suica,product)
    index = PRODUCTS.index(product)
    if suica.amount > PRICE[index] && @stocks[index] > 0
      true
    else
      false
    end
  end
  def buy(suica,product)
    index = PRODUCTS.index(product)
    if suica.amount > PRICE[index] && @stocks[index] > 0
      @stocks[index] -= 1
      @sales += PRICE[index]
      suica.buy(PRICE[index])
      return Juice.new(product,PRICE[index])
    else
      false
    end
  end

  def check_sales
    @sales
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
puts test_vender1.check_stock('ペプシ')
puts test_vender1.able_to_buy?(test1,'ペプシ')
puts test_vender1.buy(test1,'ペプシ')
puts test1.amount
puts test_vender1.check_sales
