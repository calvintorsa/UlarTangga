
import java.util.Scanner;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author USER
 */
public class Tester {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Board b = new Board();
        System.out.println("Masukkan 1 untuk Roll Dice, Masukkan 0 untuk berhenti");
        b.printtt();
        b.printBoard();
        int a = sc.nextInt();
        while (b.checkWin() == false && a == 1) {

            System.out.println("Angka yang diperoleh " + b.movee());
            b.printBoard();
            System.out.println("Posisi saat ini " + b.player1.getNowPos());
            if (b.checkWin() == false) {
                a = sc.nextInt();
            } else {
                break;
            }
        }
        System.out.println("Selamat kamu sudah menang!");
    }
}
