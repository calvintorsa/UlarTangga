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
