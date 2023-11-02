class Suica
  def initialize
    @balance = 500
  end
  def charge(charge_amount)
    if charge_amount < 100
      return false
    else
      @balance += charge_amount
    end
  end

  def show
    return @balance
  end
end

class VenderMachine
  def initialize
    {name: 'ペプシ', price: 150}
  end
end

class Juice
  def initialize

  end
end



test1 = Suica.new()
puts test1.show
puts test1.charge(300)
puts test1.show
