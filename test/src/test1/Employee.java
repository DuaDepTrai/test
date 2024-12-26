/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test1;

import java.text.SimpleDateFormat;

/**
 *
 * @author DUADEPTRAI
 */
public class Employee {
    private String name;
    private String dateJoined;
    private double salary;
    
    public Employee(String name, String dateJoined, double salary) {
        this.name = name;
        this.dateJoined = dateJoined;
        this.salary = salary;
    }
    
    public String getName() {
        return name;
    }
    
    public double getSalary() {
        return salary;
    }
    
    public java.util.Date getParseDate() {
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
            return dateFormat.parse(dateJoined);
        } catch (Exception e) {
            return null;
        }
    }
}
