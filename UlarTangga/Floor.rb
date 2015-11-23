class Floor 
    @num
    @empty
    @snake
    @ladder

    def initialize(num,empty, snake, ladder)
        @num=num
        @empty=empty
        @snake=snake
        @ladder=ladder
    end

    def setNum(num)
        @num=num
    end

    def setSnake(snake)
        @snake=snake
    end

    def setLadder(ladder)
        @ladder=ladder
    end

    def isEmpty()
        return @empty
    end

    def setEmpty(empty)
        @empty=empty
    end

    def getNum()
        return @num
    end

    def isSnake()
        return @snake
    end

    def isLadder()
        return @ladder
    end

end
