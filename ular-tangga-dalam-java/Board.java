
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
public class Board {

    Floor[][] board = new Floor[10][10];
    Player player1 = new Player();
    int curPos = 0;
    ArrayList<Ladder> ladder = new ArrayList<>();
    ArrayList<Snake> snake = new ArrayList<>();

    public Board() {
        int x = 100;
        for (int j = 0; j < 10; j++) {
            int z = 9;
            for (int i = 0; i < 10; i++) {
                if (j % 2 == 0) {
                    board[j][i] = new Floor(x);
                } else if (j % 2 == 1) {
                    board[j][z] = new Floor(x);
                    z--;
                }
                x--;
            }
        }
        this.putSnake();
        this.putLadder();
    }

    public int movee() {
        int res = this.player1.move();
        this.player1.checkLad(ladder);
        this.player1.checkSnake(snake);
        return res;
    }

    public void putLadder() {
        Random rnd = new Random();
        for (int i = 9; i > 0; i--) {
            int a = rnd.nextInt(10);
            if (this.board[i][a].isLadder() == false && this.board[i][a].isSnake() == false) {
                if (!this.board[i - 1][9 - a].isLadder() && !this.board[i - 1][9 - a].isSnake()) {
                    if (i == 9) {
                        this.board[i][a].setLadder(true);
                        Ladder l = new Ladder(this.board[i][a].getNum());
                        this.ladder.add(l);
                    } else if (!this.board[i + 1][9 - a].isLadder() && !this.board[i + 1][9 - a].isSnake()) {
                        this.board[i][a].setLadder(true);
                        Ladder l = new Ladder(this.board[i][a].getNum());
                        this.ladder.add(l);
                    }
                }
            }
        }
    }

    public void printtt() {
        String snake = "";
        String ladder = "";
        for (int i = 0; i < 10; i++) {
            for (int j = 0; j < 10; j++) {
                if (this.board[i][j].isSnake() == true) {
                    snake += this.board[i][j].getNum() + " ";
                } else if (this.board[i][j].isLadder() == true) {
                    ladder += this.board[i][j].getNum() + " ";
                }
            }
        }
        System.out.println("Ular : " + snake);
        System.out.println("Tangga : " + ladder);
    }

    public void putSnake() {
        Random rnd = new Random();
        for (int i = 0; i < 9; i++) {
            int a = rnd.nextInt(10);
            if (this.board[i][a].isLadder() == false && this.board[i][a].isSnake() == false) {
                if (!this.board[i + 1][9 - a].isLadder() && !this.board[i + 1][9 - a].isSnake()) {
                    if (i == 0) {
                        this.board[i][a].setSnake(true);
                        Snake s = new Snake(this.board[i][a].getNum());
                        this.snake.add(s);
                    } else if (!this.board[i - 1][9 - a].isLadder() && !this.board[i - 1][9 - a].isSnake()) {
                        this.board[i][a].setSnake(true);
                        Snake s = new Snake(this.board[i][a].getNum());
                        this.snake.add(s);
                    }
                }
            }
        }
    }

    public void printBoard() {
        for (int i = 0; i < 10; i++) {
            for (int j = 0; j < 10; j++) {
                if (this.board[i][j].getNum() != this.player1.getNowPos() && (this.board[i][j].isLadder() == false && this.board[i][j].isSnake() == false)) {
                    System.out.print(". ");
                } else if (this.board[i][j].isSnake() == true) {
                    System.out.print("S ");
                } else if (this.board[i][j].isLadder() == true) {
                    System.out.print("# ");
                } else {
                    System.out.print("P ");
                }
            }
            System.out.println("");
        }
    }

    public boolean checkWin() {
        if (this.player1.getNowPos() == 100) {
            return true;
        } else {
            return false;
        }
    }
}
