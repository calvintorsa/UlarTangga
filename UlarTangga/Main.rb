require 'java'

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
  
  def  gotSnake
    if @position.isSnake
      @position.setNum (@position.getNum-10)
    end
  end


  def gotLadder
    if @position.isLadder
      @position.setNum (@position.getNum+10)
    end
  end

  def getNowPos
    return @position.getNum
  end
  
  def setNowPos(angka)
    @position.setNum(angka)
  end
end

class Ladder
  @posInBoard
  
  def initialize(pos)
    @posInBoard = pos
  end
  
  def getPosInBoard
    return @posInBoard
  end
  
  def setPosInBoard(pos)
    @posInBoard = pos
  end
end

class Snake
  @posInBoard
  
  def initialize(pos)
    @posInBoard = pos
  end
  
  def getPosInBoard
    return @posInBoard
  end
  
  def setPosInBoard(pos)
    @posInBoard = pos
  end
end

class Board
  @board
  @player1
  @player2
  @ladder = []
  @snake = []
  
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
              @player1.setNowPos(@player2.getNowPos-10)
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

b = Board.new
puts "Masukkan 1 untuk memulai Permainan, Masukkan 0 untuk berhenti"
b.printBoard
b.printSnake
b.printLadder
input = gets.to_i
print "Pilih mode permainan (1.Player vs Player, 2.Player vs Computer): "
mode = gets.to_i
counter = 1
if input==1
  if mode==1
    while b.checkWin1 == false && b.checkWin2 == false
      if counter%2==1
        puts "Giliran P1!"
        puts"Ketik angka lebih dari 0 untuk roll dice!"
        x = gets.to_i
        if x > 0 
          num = b.move1
          print"Angka yang diperoleh P1 "
          puts num
          print "Posisi P1 saat ini "
          puts b.getPlayer1Pos
          b.printBoard
          if b.checkWin1 == false && num != 6 
            counter+=1
            puts ""
          elsif num == 6 && b.checkWin1 == false
            puts ""
            puts "Pemain P1 mendapat giliran ganda!"
          else 
            puts "Selamat P1 Menang!"
            break    
          end
          else
            puts "Permainan dihentikan oleh Player 1!"
            break
        end
      else
        puts "Giliran P2!"
        puts"Ketik angka lebih dari 0 untuk roll dice!"
        x = gets.to_i
        if x > 0 
          num = b.move2
          print"Angka yang diperoleh P2 "
          puts num
          print "Posisi P2 saat ini "
          puts b.getPlayer2Pos
          b.printBoard
          if b.checkWin2 == false && num != 6 
            counter-=1
            puts ""
          elsif num == 6 && b.checkWin2 == false
            puts ""
            puts "Pemain P2 mendapat giliran ganda!"
          else 
            puts "Selamat P2 Menang!"
            break    
          end
          else
            puts "Permainan dihentikan oleh Player 2!"
            break
        end
      end
    end
  else
    while b.checkWin1 == false && b.checkWin2 == false
      if(counter%2==1)
        puts "Giliran P1!"
        puts"Ketik angka lebih dari 0 untuk roll dice!"
        x = gets.to_i
        if x > 0 
          num = b.move1
          print"Angka yang diperoleh P1 "
          puts num
          print "Posisi P1 saat ini "
          puts b.getPlayer1Pos
          b.printBoard
          if b.checkWin1 == false && num != 6 
            puts ""
            counter+=1
          elsif num == 6 && b.checkWin1 == false
            puts ""
            puts "Pemain P1 mendapat giliran ganda!"
          else 
            puts "Selamat P1 Menang!"
            break    
          end
          else
            puts "Permainan dihentikan oleh Player 1!"
            break
        end
      else
        puts "Giliran Computer!"
        num = b.move2
        print"Angka yang diperoleh Computer "
        puts num
        print "Posisi Computer saat ini "
        puts b.getPlayer2Pos
        b.printBoard
        if b.checkWin2 == false && num != 6 
          puts ""
          counter-=1
        elsif num == 6 && b.checkWin2 == false
          puts ""
          puts "Computer mendapat giliran ganda!"
        else 
          puts "Sayang sekali Computer Menang!"
          break    
        end
      end
    end
  end
else
  puts "Permainan dihentikan oleh player!"
end
