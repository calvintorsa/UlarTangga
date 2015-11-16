/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author USER
 */
public class Snake {
    int num;
    boolean placed;
    int posInBoard;

    public Snake(int pos)
    {
        this.placed = false;
        this.num = 10;
        this.posInBoard = pos;
    }
    
    public void setPosInBoard(int posInBoard) {
        this.posInBoard = posInBoard;
    }

    public int getPosInBoard() {
        return posInBoard;
    }
    
    

    public boolean isPlaced() {
        return placed;
    }

   

    public void setPlaced(boolean placed) {
        this.placed = placed;
    }
}
