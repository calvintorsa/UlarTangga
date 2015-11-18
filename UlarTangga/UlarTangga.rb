class Ladder
	@num
	@placed
	@posInBoard
	
	def initialize
		num = 10
		placed = false
		posInBoard = 0
	end
	
	def setPosInBoard(pos)
		posInBoard = pos
	end
	
	def getPosInBoard
		return posInBoard
	end
	
	def setPlaced(placed)
		placed = placed
	end
	
	def getPlaced
		return placed
	end
end
