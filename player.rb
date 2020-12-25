class Player
  attr_reader :sign, :name, :id
  @@id = 0

  def initialize(name, sign)
    @name = name
    @sign = sign
    @id = @@id
    @@id += 1
  end
end