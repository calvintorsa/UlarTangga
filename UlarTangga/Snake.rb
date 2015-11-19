class Ladder
  @num
  @placed
  @posInBoard
  
  def initialize(pos)
    @num = 10
    @placed = false
    @posInBoard = pos
  end
  def setPosInBoard(pos)
    @posInBoard = pos
  end
  def getPosInBoard
    return @posInBoard
  end
  def isPlaced
    return @placed
  end
  def setPlaced(placed)
    @placed = placed
  end
end
