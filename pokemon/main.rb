module NameService
  def valid_name_is?(new_name)
    new_name != 'うんこ'
  end
  def get_name
    @name
  end
end

class Pokemon
  include NameService
  attr_reader :name,:type1,:type2,:hp
  def initialize(name,type1,type2,hp)
    @name = name
    @type1 = type1
    @type2 = type2
    @hp = hp
  end

  def attack
    "#{@name} のこうげき!"
  end

  def pokemon_name_change(new_name)
    if valid_name_is?(new_name)
      @name = new_name
    else
      '不適切な名前です'
    end
  end

end

class Player
  include NameService
  def initialize(name)
    @name = name
  end
  def user_name_change(new_name)
    if valid_name_is?(new_name)
      @name = new_name
    else
      '不適切な名前です'
    end
  end
end



class Pikachu < Pokemon
  def initialize(*) #引数「＊」でSuperクラスにそのまま引数を渡す
    super
  end

  def attack
    "#{@name}の10万ボルト!"
  end
end


#poke = Pokemon.new
#puts poke.name
#puts poke.attack

pika = Pikachu.new("ピカチュウ", "でんき", "", 100)
p1 = Player.new('ワシ')
puts pika.name
puts pika.attack
puts p1.get_name
puts p1.user_name_change('A')
puts p1.get_name
puts p1.user_name_change('うんこ')
puts p1.get_name
