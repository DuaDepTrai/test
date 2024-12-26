/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test1;

import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 *
 * @author DUADEPTRAI
 */
public class EmployeeManage {
    public static void main(String[] args) {
        Scanner s = new Scanner(System.in);
        
        System.out.print("Enter language ('en' for English, 'vi' for Vietnamese): ");
        String langCode = s.nextLine();
        
        Locale locale;
        if (langCode.equalsIgnoreCase("vi")) {
            locale = new Locale("vi", "VN");
        } else {
            locale = new Locale("en", "US");
        }
        
        ResourceBundle bundle = ResourceBundle.getBundle("test1.lang", locale);
        
        List<Employee> employees = new ArrayList<>();
        employees.add(new Employee("Nguyễn Văn A", "10-05-2020", 15000000.5));
        employees.add(new Employee("John Smith", "01-03-2018", 2500.75));
        
        for (Employee emp : employees) {
            System.out.println(bundle.getString("name") + emp.getName());
            
            SimpleDateFormat dateFormat = new SimpleDateFormat(bundle.getString("date.format"), locale);
            String formattedDate = dateFormat.format(emp.getParseDate());
            System.out.println(bundle.getString("dateJoined") + formattedDate);
            
            NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(locale);
            String formattedSalary = currencyFormat.format(emp.getSalary());
            System.out.println(bundle.getString("salary") + formattedSalary);
            System.out.println();
        }
        
        s.close();
    }
}
