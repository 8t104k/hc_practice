class Suica
  attr_reader :balance

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

end
