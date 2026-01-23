/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package Ex.Kiet;

import java.util.HashMap;

/**
 *
 * @author student
 */
public class KietDepTrai {

    public static void main(String[] args) {
        // TODO code application logic here
        int[] mang = {12, 45, 7, 82, 21, 18};
        chay1(mang);
        chay2(mang);
        chay3();
        String input = "abcbad";
        try {
            chay4(input);

        } catch (Exception e) {
            System.out.println("Vui long nhap String");
        }
    }

    private static void chay1(int[] mang) {
        int sum = 0;
        for (int a : mang) {
            sum += a;
        }

        int max = 9999999;
        for (int i = 0; i < mang.length - 1; i++) {
            max = mang[i];
            if (mang[i] < mang[i + 1]) {
                max = mang[i + 1];
            }
        }

        int count = 0;
        for (int a : mang) {
            if (a % 2 != 0) {
                count++;
            }
        }

        System.out.println("Sum of array :" + sum);
        System.out.println("Max of array " + max);
        System.out.println("The count of even numbers in the array: " + count);

    }

    private static void chay2(int[] mang) {
        for (int i = 0; i < mang.length - 1; i++) {
            int key = mang[i];
            if (i < mang.length) {
                int j = i - 1;
                while (j >= 0 && key < mang[j]) {
                    mang[j + 1] = mang[j];
                    j -= 1;
                    mang[j + 1] = key;
                }
            }

        }
        System.out.print("Danh sach:");
        for (int i : mang) {
            System.out.print(" " + i);
        }
        System.out.println(" ");

    }

    private static void chay3() {
        //1
        HashMap mang = new HashMap();

//      StudentGrade hocSinh = new StudentGrade("Alice", 85);
//      hocSinh.addHocSinh();
        mang.put("Alice", 85);
        mang.put("Bob", 92);
        mang.put("Charlie", 78);

        //2
        String name = "Bob";
        System.out.println("Bob's grade " + mang.get(name).toString());

        String nameToDelete = "Alice";
        mang.remove(nameToDelete);

        //3
        System.out.println("Remaining student" + mang.toString());
    }

    private static void chay4(String input) {
        if (input == null || input.length() < 3) {
            System.out.println("No palindromic substring found");
            return;
        }

        for (int i = 0; i < input.length() - 2; i++) {
            if (input.charAt(i) == input.charAt(i + 2)) {
                System.out.println("First palindromic substring: " + 
                                   input.substring(i, i + 3));
                return;
            }
        }

        System.out.println("No palindromic substring found");
    }
}
