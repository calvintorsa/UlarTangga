class Player
  @position
  
  def initialize
    @position = Floor.new(1)
  end
  
  def rollDice
    return Random.rand(6)+1
  end
  
  def move
    a = rollDice
    if @position.getNum == 1
      @position.setNum(a)
      return a
    elsif @position.getNum+a>100
      b = @position.getNum+a
      @position.setNum(100-(b-100))
      return a
    else
      @position.setNum(@position.getNum+a)
      return a
    end
  end

  def getNowPos
    return @position.getNum
  end
  
  def setNowPos(angka)
    @position.setNum(angka)
  end
end
