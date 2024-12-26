/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test3;

import java.util.List;

/**
 *
 * @author DUADEPTRAI
 */
public class Main {
    public static void main(String[] args) {
        MovieRentalSystem system = new MovieRentalSystem();
        
        List<RentalRecord> records = system.initializeRentals();
        
        RentalRecord longestRental = system.getLongestRental(records);
        System.out.println("Longest Rental: " + longestRental.getMovie().getTitle()
                            + " - Rental Days: " + longestRental.getRentalDays());
        
        RentalRecord shortestRental = system.getShortestRental(records);
        System.out.println("Shortest Rental: " + shortestRental.getMovie().getTitle()
                            + " - Rental Days: " + shortestRental.getRentalDays());
        
        long totalMovies = system.countTotalMovies(records);
        System.out.println("Total Movies Rental: " + totalMovies);
    }
}
