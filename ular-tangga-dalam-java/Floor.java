/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author USER
 */
public class Floor {
    int num;
    boolean empty;
    boolean snake;
    boolean ladder;

    public Floor(int num)
    {
        this.num = num;
        this.snake = false;
        this.ladder = false;
        this.empty = true;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public void setSnake(boolean snake) {
        this.snake = snake;
    }

    public void setLadder(boolean ladder) {
        this.ladder = ladder;
    }

    public boolean isEmpty() {
        return empty;
    }

    public void setEmpty(boolean empty) {
        this.empty = empty;
    }
    
    public int getNum() {
        return num;
    }

    public boolean isSnake() {
        return this.snake;
    }

    public boolean isLadder() {
        return this.ladder;
    }
    
    /*public int getSnakeNum()
    {
        return this.snake.getNum();
    }
    
    public int getLadderNum()
    {
        return this.ladder.getNum();
    }*/
}
