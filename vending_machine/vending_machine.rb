class Suica
  def initialize
    @balance = 500
  end
  def charge(charge_amount)
    if charge_amount < 100
      false
    else
      @balance += charge_amount
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
  PRODUCTS = {
    'ペプシ' => {price: 150, stock: 5},
    'モンスター' => {price:230, stock: 5},
    'いろはす' => {price:120, stock: 5}
  }

  def initialize
    @sales = 0
    @products = PRODUCTS
  end

  def check_stock(product)
    return @products[product][:stock] if @products.key?(product)
  end
  def able_to_buy?(suica,product)
    if @products.key?(product)
      price = @products[product][:price]
      stock = @products[product][:stock]
      suica.amount > price && stock > 0
    else
      false
    end
  end
  def buy(suica,product)
    amount = suica.amount
    price = @products[product][:price]
    stock = @products[product][:stock]

    return '残高が足りません' if amount < price
    return '在庫がありません' if stock <= 0
    @sales += price
    suica.buy(price)
    return Juice.new(product,price)
  end

  def show_sales
    @sales
  end

  def show_buyable_list

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
puts test_vender1.show_sales
