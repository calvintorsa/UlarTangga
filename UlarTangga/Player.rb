class Player 
    @position
    
    def initialize()
    
      @position = Floor(1).new
    end
    
    def rollDice()
    
      return Random.new(6)+1
    end
    def move()
    
      a = rollDice()
      if @position.getNum()==1
        
        @position.setNum(a)
        return a
        
        elsif @position.getNum()+a>100
        
          b = @position.getNum()+a
          @position.setNum(100-(b-100))
          return a
        
        elsif
        
          @position.setNum(@position.getNum()+a)
          return a
        
      end
    end
    
    def checkLad(ladder)
      
      for i in 0..ladder.size()
          
        if ladder.get(i).getPosInBoard()== @position.getNum()
              
          if @position.getNum()>=80 && @position.getNum()<90
                  
            @position.setNum(@position.getNum()+10)
            print "Kamu naik tangga!"
            break
                  
            elsif
                  
            rand = Random.new(31)+10
            if @position.getNum()+rand>100
                      
              @position.setNum(@position.getNum()+10)
                puts "Kamu naik tangga!"
                break
                        
                elsif
                        
                @position.setNum(@position.getNum()+rand)
                puts "Kamu naik tangga!"
                break
              end
            end
        end
      end
    end
    
    def checkSnake(snake)
      
      for i in 0..snake.size()
        if snake.get(i).getPosInBoard()== @position.getNum()
            
                if @position.getNum()<20 && @position.getNum()>=10
                  
            @position.setNum(@position.getNum()-10)
                  print "Kamu terkena Ular!"
            break
                  
            elsif
                  
            rand = Random.new(31)+10
            if @position.getNum()-rand>0
                      
              @position.setNum(@position.getNum()+10)
              puts "Kamu terkena Ular!"
              break
            end
          end
        end
      end
    end
                
    def  gotSnake()

        if @position.isSnake()

            @position.setNum (@position.getNum()-10)
          
        end
    end

    
    def gotLadder()

        if @position.isLadder()

            @position.setNum (@position.getNum()+10)
          
        end
    end
          
    def getNowPos()

        return @position.getNum();
    end

end

        
