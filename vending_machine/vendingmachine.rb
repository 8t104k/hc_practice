class VendingMachine
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
    @products[product][:stock] -= 1
    suica.buy(price)
    return Juice.new(product,price)
  end

  def show_sales
    @sales
  end

  def show_buyable_list
    buyable_list = @products.select { |product,p_info| p_info[:stock] > 0 }.keys
    #buyable_list = buyable_list.keys
  end

  def fill_products(product, fill_num)
    if @products.key?(product)
      @products[product][:stock] += fill_num
    end
  end

end
