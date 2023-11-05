class VendingMachine
  PRODUCTS = {
    'ペプシ' => {price: 150},
    'モンスター' => {price:230},
    'いろはす' => {price:120}
  }
  INITIAL_STOCK = 5

  def initialize
    @sales = 0
    @products = {}
    PRODUCTS.map do |product_name,info|
      @products[product_name] = []
      #初期ストック分、Juiceのインスタンスを作成
      INITIAL_STOCK.times{ @products[product_name] << Juice.new(product_name,info[:price])}
    end
  end

  def check_stock(product_name)
    return @products[product_name].length if @products.key?(product_name)
  end
  def able_to_buy?(suica,product_name)
    return false unless products.key?(product_name)
    price = PRODUCTS[product_name][:price]
    stock = @products[product_name].length
    suica.amount > price && stock > 0
  end
  def buy(suica,product_name)
    amount = suica.amount
    price = PRODUCTS[product_name][:price]
    stock = @products[product_name].length

    return '残高が足りません' if amount < price
    return '在庫がありません' if stock <= 0
    @sales += price
    suica.buy(price)
    return @products[product_name].shift
  end

  def show_sales
    @sales
  end

  def show_buyable_list
    @products.select { |product,p_info| p_info.length > 0 }.keys
  end

  def fill_products(product_name)
    if @products.key?(product_name)
      price = PRODUCTS[product_name][:price]
      @products[product_name] << Juice.new(product_name,price)
    end
  end

end
