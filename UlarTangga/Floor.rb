class Floor
  @num
  @snake
  @ladder
  
  def initialize(angka)
    @num =  angka
    @snake = false
    @ladder = false
  end
  
  def setNum(angka)
    @num =  angka
  end
  
  def getNum
    return @num
  end
  
  def setSnake(ular)
    @snake = ular
  end
  
  def setLadder(tangga)
    @ladder = tangga
  end
  
  def isSnake
    return @snake
  end
  
  def isLadder
    return @ladder
  end
end
