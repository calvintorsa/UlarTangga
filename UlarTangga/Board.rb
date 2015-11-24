class Board
  @board
  @player1
  @player2
 
  
  def initialize
    @player1 = Player.new
    @player2 = Player.new
    x = 100
    @board = Array.new(10){Array.new(10)}
    for i in 0..9
      k = 9
      for j in 0..9
        if i%2 == 0
          @board[i][j] = Floor.new(x)
          x-=1
        elsif
          @board[i][k] = Floor.new(x)
          x-=1
          k-=1
        end
      end
    end
    putSnake
    putLadder
  end
  
  def checkLad1()
    for i in 0..9
      for j in 0..9
        if @board[i][j].getNum == @player1.getNowPos
          if @board[i][j].isLadder==true
            if @player1.getNowPos>=80 && @player1.getNowPos<90 
              @player1.setNowPos(@player1.getNowPos+10)
              puts "Kamu naik tangga!"
            else
              rand = Random.rand(31)+10
              if(@player1.getNowPos+rand>100)
                @player1.setNowPos(@player1.getNowPos+10)
                puts "Kamu naik tangga!"
              else
                @player1.setNowPos(@player1.getNowPos+rand)
                puts"Kamu naik tangga!"
              end
            end
          end
        end
      end
    end
  end
  
  def checkLad2()
    for i in 0..9
      for j in 0..9
        if @board[i][j].getNum == @player2.getNowPos
          if @board[i][j].isLadder==true
            if @player2.getNowPos>=80 && @player2.getNowPos<90 
              @player2.setNowPos(@player2.getNowPos+10)
              puts "Kamu naik tangga!"
            else
              rand = Random.rand(31)+10
              if(@player2.getNowPos+rand>100)
                @player2.setNowPos(@player2.getNowPos+10)
                puts "Kamu naik tangga!"
              else
                @player2.setNowPos(@player2.getNowPos+rand)
                puts"Kamu naik tangga!"
              end
            end
          end
        end
      end
    end
  end
  
  def checkSnake1()
    for i in 0..9
      for j in 0..9
        if @board[i][j].getNum == @player1.getNowPos
          if @board[i][j].isSnake==true
            if @player1.getNowPos<20 && @player1.getNowPos>10 
              @player1.setNowPos(@player1.getNowPos-10)
              puts "Kamu kena ular!"
            else
              rand = Random.rand(31)+10
              if(@player1.getNowPos-rand<0)
                @player1.setNowPos(@player1.getNowPos-10)
                puts "Kamu kena ular!"
              else
                @player1.setNowPos(@player1.getNowPos-rand)
                puts"Kamu kena ular!"
              end
            end
          end
        end
      end
    end
  end
  
  def checkSnake2()
    for i in 0..9
      for j in 0..9
        if @board[i][j].getNum == @player2.getNowPos
          if @board[i][j].isSnake==true
            if @player2.getNowPos<20 && @player2.getNowPos>10 
              @player2.setNowPos(@player2.getNowPos-10)
              puts "Kamu kena ular!"
            else
              rand = Random.rand(31)+10
              if(@player2.getNowPos-rand<0)
                @player2.setNowPos(@player2.getNowPos-10)
                puts "Kamu kena ular!"
              else
                @player2.setNowPos(@player2.getNowPos-rand)
                puts"Kamu kena ular!"
              end
            end
          end
        end
      end
    end
  end
  
  def move1
    res = @player1.move
    checkLad1
    checkSnake1
    return res
  end
  
  def move2
    res = @player2.move
    checkLad2
    checkSnake2
    return res
  end
  
  def putLadder
    for i in 1..9
      a = Random.rand(9)+1
      if(@board[i][a].isLadder==false && @board[i][a].isSnake==false)
        if(!@board[i-1][9-a].isLadder && !@board[i-1][9-a].isSnake)
          if(i==9)
            @board[i][a].setLadder(true)
          elsif !@board[i + 1][9 - a].isLadder && !@board[i + 1][9 - a].isSnake
            @board[i][a].setLadder(true)
          end
        end
      end
    end
  end
  
  def putSnake
    for i in 0..8
      a = Random.rand(9)
      if @board[i][a].isLadder==false && @board[i][a].isSnake==false && @board[i][a].getNum!=100
        if !@board[i+1][9-a].isLadder && !@board[i+1][9-a].isSnake
          if i==0
            @board[i][a].setSnake(true)
          elsif !@board[i - 1][9 - a].isLadder && !@board[i - 1][9 - a].isSnake
            @board[i][a].setSnake(true)
          end
        end
      end
    end
  end
  
  def printBoard
    for i in 0..9
      for j in 0..9
        if @board[i][j].getNum != @player1.getNowPos && @board[i][j].getNum != @player2.getNowPos &&(@board[i][j].isLadder==false && @board[i][j].isSnake==false)
          print ".  "
        elsif @board[i][j].isSnake == true
          print "S  "
        elsif @board[i][j].isLadder == true
          print "#  "
        elsif @board[i][j].getNum == @player2.getNowPos && @board[i][j].getNum != @player1.getNowPos
          print "P2 "
        elsif @board[i][j].getNum == @player1.getNowPos && @board[i][j].getNum != @player2.getNowPos
          print "P1 "
        else
          print "AP "
        end
      end
      puts ""
    end
  end
  
  def checkWin1
    if @player1.getNowPos == 100
      return true
    else
      false
    end
  end
  
  def checkWin2
    if @player2.getNowPos == 100
      return true
    else
      false
    end
  end
  
  def getPlayer1Pos
    return @player1.getNowPos
  end
  
  def getPlayer2Pos
    return @player2.getNowPos
  end
  
  def printSnake
    print "Snake "
    for i in 0..9
      for j in 0..9
        if @board[i][j].isSnake == true
          print @board[i][j].getNum
          print " "
        end
      end
    end
    puts ""
  end
  
  def printLadder
    print "Ladder "
    for i in 0..9
      for j in 0..9
        if @board[i][j].isLadder == true
          print @board[i][j].getNum
          print " "
        end
      end
    end
    puts ""
  end
end
