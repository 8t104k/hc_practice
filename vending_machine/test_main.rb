require_relative 'vendingmachine.rb'
require_relative 'suica.rb'
require_relative 'juice.rb'

test_vender1 = VendingMachine.new()
test1 = Suica.new()

puts test1.amount
#エラーになる
#puts test1.amount = 1000
puts test1.charge(300)
puts test1.amount
puts test_vender1.check_stock('ペプシ')
puts test_vender1.able_to_buy?(test1,'ペプシ')
puts test_vender1.buy(test1,'ペプシ')
puts test_vender1.buy(test1,'いろはす')
puts test_vender1.buy(test1,'モンスター')
puts test_vender1.buy(test1,'モンスター')
puts test_vender1.buy(test1,'モンスター')
puts test1.charge(10000)
puts test_vender1.buy(test1,'モンスター')
puts test_vender1.buy(test1,'モンスター')
puts test_vender1.buy(test1,'モンスター')
p test_vender1.show_buyable_list
puts test_vender1.buy(test1,'モンスター')
puts test_vender1.check_stock('モンスター')
puts test_vender1.fill_products('モンスター',10)
puts test_vender1.check_stock('モンスター')
puts test1.amount
puts test_vender1.show_sales
p test_vender1.show_buyable_list
