
import java.util.ArrayList;
import java.util.Random;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author USER
 */
public class Player {
    Floor position;
    
    public Player()
    {
        this.position = new Floor(1);
    }
    
    private int rollDice()
    {
        Random rnd = new Random();
        return rnd.nextInt(6)+1;
    }
    
    public int move()
    {
        int a = this.rollDice();
        if(this.position.getNum()+a>=100)
        {
            this.position.setNum(100);
            return a;
        }
        else
        {
            this.position.setNum(this.position.getNum()+a);
            return a;
        }
    }
    
    public void checkLad(ArrayList<Ladder> ladder)
    {
        for(Ladder l : ladder)
        {
            if(l.getPosInBoard()==this.position.getNum())
            {
                this.position.setNum(this.position.getNum()+10);
                System.out.println("aya tangga");
                break;
            }
        }
    }
    
    public void checkSnake(ArrayList<Snake> snake)
    {
        for(Snake s : snake)
        {
            if(s.getPosInBoard()==this.position.getNum())
            {
                this.position.setNum(this.position.getNum()-10);
                System.out.println("aya oray");
                break;
            }
        }
    }
    public void gotSnake()
    {
        if(position.isSnake())
        {
            this.position.setNum(this.position.getNum()-10);
        }
    }
    
    public void gotLadder()
    {
        if(position.isLadder())
        {
            this.position.setNum(this.position.getNum()+10);
        }
    }
    
    public int getNowPos()
    {
        return this.position.getNum();
    }
}
