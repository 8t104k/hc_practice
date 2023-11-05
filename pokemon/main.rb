class Pokemon
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
puts pika.name
puts pika.attack
