/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Practice;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

/**
 *
 * @author DUADEPTRAI
 */
public class DSA_0118 {
    public static void main(String[] args) {
        Scanner s = new Scanner(System.in);
        int choice;
        do{
            System.out.println("\n=== MENU===");
            System.out.println("1. Tinh toan mang");
            System.out.println("2. Tong so chia het cho 7");
            System.out.println("3. Quan ly diem hoc sinh (HashMap)");
            System.out.println("4. Tim kiem nhi phan");
            System.out.println("5. Chuyen mang thanh cay nhi phan");
            System.out.println("0. Thoat");
            System.out.print("Chon bai: ");
            choice = s.nextInt();
            
            switch (choice) {
                case 1:
                    processArray();
                    break;
                case 2:
                    sumDivisibleBy7();
                    break;
                case 3:
                    StudentGradeManager();
                    break;
                case 4:
                    binarySearch();
                    break;
                case 5:
                    arrayToBinaryTree();
                    break;
                case 0:
                    System.out.println("Bye!!!...");
                    break;
                default:
                    System.out.println("Invalid choice, try again!");
            }
        } while (choice != 0);
        
        s.close();
    }
    
    //==================
    //ARRAY
    private static void processArray(){
        Scanner s = new Scanner(System.in);
        
        //Khai bao va nhap phan tu:
        int n;
        do {
            System.out.print("Nhap so phan tu mang: ");
            n = s.nextInt();
            if (n <= 0 ){
                System.out.println("N khong hop le, nhap lai.");
            }
        } while (n <= 0);
        
        int[] arr = new int[n];
        System.out.println("Nhap " + n + " phan tu cua mang:");
        for (int i=0; i<n; i++){
            System.out.print("arr[" + i + "] = ");
            arr[i] = s.nextInt();
        }
        
        //Tinh tong phan tu:
        int sum = 0;
        for (int a : arr){
            sum += a;
        }        
        System.out.println("Tong cac phan tu = " + sum);
        
        //Tim max
        int max = arr[0];
        for (int a : arr){
            if (a > max){
                max = a;
            }
        }
        System.out.println("Phan tu lon nhat = " + max);
        
        //Tim so phan tu la so le:
        int count = 0;
        for (int a : arr){
            if (a%2 != 0){
                count += 1;
            }
        }
        System.out.println("So phan tu le = " + count);
        
        //Sap xep mang
        System.out.print("Mang chua sap xep: ");
        for (int a : arr){
            System.out.print(a + " ");
        };
        
        boolean sw;
        for (int i = 0; i < n-1; i++){
            sw = false;
            for (int j = 0; j < n-1-i; j++){
                if (arr[j] > arr[j+1]){
                    int t = arr[j];
                    arr[j] = arr[j+1];
                    arr[j+1] = t;
                    
                    sw = true;
                }                
            }
            
            if (!sw){
                break;
            }
        }
        System.out.print("\nMang da sap xep: ");
        for (int a : arr){
            System.out.print(a + " ");
        };
    }
    
    
    //==================
    //LOOP
    private static void sumDivisibleBy7(){
        Scanner s = new Scanner(System.in);
        
        //Khai bao va nhap:
        int start, end;
        do {
            System.out.print("Start = ");
            start = s.nextInt();
            System.out.print("End = ");
            end = s.nextInt();
            
            if (start > end ){
                System.out.println("Start phai lon hon End.");
            }
            
            if (start < 0 || end < 0 ){
                System.out.println("Start/End phai lon hon 0.");
            }
        } while (start < 0 || end < 0 || start > end);
        
        //Tinh tong
        int sum = 0;
        for (int i = start; i <= end; i++){
            if (i % 7 == 0){
                sum += i;
            }
        }
        System.out.println("Tong cac so chia het cho 7 nam trong khoang tu " + start + " den " + end + " = " + sum);
    }
    
    
    //==================
    //HASHMAP
    private static void StudentGradeManager(){
        Scanner sc = new Scanner(System.in);
        HashMap<String, Integer> studentGrades = new HashMap<>();
        
        //Nhap thong tin:
        System.out.println("Nhap so luong hoc sinh: ");
        int n;
        while (true) {            
            try{
                n = Integer.parseInt(sc.nextLine().trim());
                if (n <= 0){
                    System.out.println("N phai lon hon 0, nhap lai");
                    continue;
                }
                break;
            } catch (NumberFormatException e){
                System.out.println("Nhap so nguyen hop le.");
            }
        }
        
        System.out.println("Nhap thong tin cho " + n + " hoc sinh:");
        for (int i = 1; i <= n; i++){
            System.out.print("Ten hoc sinh thu " + i + ": ");
            String name = sc.nextLine().trim();
            
            System.out.print("Diem hoc sinh thu " + i + ": ");
            int grade;
            while(true){
                try {
                    grade = Integer.parseInt(sc.nextLine().trim());
                    if (grade < 0 || grade > 10){
                        System.out.println("Diem phai tu 0 den 10, nhap lai");
                        continue;
                    }
                    break;
                } catch (NumberFormatException e){
                    System.out.println("Nhap so nguyen hop le");
                }
            }
            
            studentGrades.put(name, grade);
        }
        
        //In diem cua hoc sinh
        System.out.println("\nNhap ten hoc sinh can xem diem: ");
        String searchName = sc.nextLine().trim();
        
        if(studentGrades.containsKey(searchName)){
            System.out.println("Diem cua " + searchName + ": " + studentGrades.get(searchName));
        } else {
            System.out.println("Khong tim thay hoc sinh " + searchName);
        }
        
        //Xoa hoc sinh
        System.out.println("\nNhap ten hoc sinh can xoa: ");
        String deleteName = sc.nextLine().trim();
        
        if(studentGrades.containsKey(deleteName)){
            studentGrades.remove(deleteName);
            System.out.println("Da xoa hoc sinh " + deleteName);
        } else {
            System.out.println("Khong tim thay hoc sinh " + deleteName);
        }
        
        //In danh sach hoc sinh sau xoa
        System.out.println("\nDanh sach hoc sinh con lai: ");
        if (studentGrades.isEmpty()){
            System.out.println("Danh sach rong");
        } else {
            for (Map.Entry<String, Integer> entry : studentGrades.entrySet()){
                System.out.println(entry.getKey() + ": " + entry.getValue() + " diem");
            }
        }
    }
    
    //==============
    //BINARY SEARCH
    private static void binarySearch(){
        Scanner s = new Scanner(System.in);
        
        //Khai bao va nhap phan tu:
        int n;
        do {
            System.out.print("Nhap so phan tu mang: ");
            n = s.nextInt();
            if (n <= 0 ){
                System.out.println("N khong hop le, nhap lai.");
            }
        } while (n <= 0);
        
        int[] arr = new int[n];
        System.out.println("Nhap " + n + " phan tu cua mang:");
        for (int i=0; i<n; i++){
            System.out.print("arr[" + i + "] = ");
            arr[i] = s.nextInt();
        }
        
        //Sap xep mang
        boolean sw;
        for (int i = 0; i < n-1; i++){
            sw = false;
            for (int j = 0; j < n-1-i; j++){
                if (arr[j] > arr[j+1]){
                    int t = arr[j];
                    arr[j] = arr[j+1];
                    arr[j+1] = t;
                    
                    sw = true;
                }                
            }
            
            if (!sw){
                break;
            }
        }
        
        //Nhap target:
        System.out.print("Nhap phan tu can tim kiem: ");
        int t = s.nextInt();
        
        //Tim kiem
        int left = 0;
        int right = arr.length-1;
        int pos = -1;
        while (left <= right) {
            int mid = left + (right-left)/2;
            
            if (arr[mid] == t) {
                pos = mid;
            }
            if (arr[mid] < t) {
                left = mid + 1;
            } else {
                right = mid -1;
            }            
        }
        
        //Hien thi ket qua
        if (pos == -1) {
            System.out.println("Khong tim thay phan tu " + t + " trong mang");
        } else {
            System.out.println("Phan tu " + t + " o vi tri thu: " + pos);
        }
    }
    
    
    //=================
    //ARRAY TO BINARY TREE
    private static void arrayToBinaryTree(){
        int[] a = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15};
        
        TreeNode root = arrrayToBinaryTree(a, 0);
        
        System.out.print("Inorder Traversal of Binary Tree: ");
        inorderTraversal(root);
    }
    
    private static TreeNode arrrayToBinaryTree(int[] arr, int index) {
        if (index >= arr.length) {
            return null;
        }
        
        TreeNode node = new TreeNode(arr[index]);
        
        node.left = arrrayToBinaryTree(arr, 2*index+1);
        node.right = arrrayToBinaryTree(arr, 2*index+2);
        
        return node;
    }
    
    private static void inorderTraversal(TreeNode root) {
        if (root != null) {
            inorderTraversal(root.left);
            System.out.print(root.value + " ");
            inorderTraversal(root.right);
        }
    }
}

class TreeNode {
    int value;
    TreeNode left, right;
    
    public TreeNode(int value) {
        this.value = value;
        this.left = left;
        this.right = right;
    }
    
    @Override
    public String toString(){
        return String.valueOf(value);
    }
}