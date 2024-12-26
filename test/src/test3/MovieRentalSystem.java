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
public class MovieRentalSystem {
    public List<RentalRecord> initializeRentals() {
        Movie movie1 = new Movie("Inception", 148, "Christopher Nolan");
        Movie movie2 = new Movie("The Matrix", 136, "Lana Wachowski");
        Movie movie3 = new Movie("Titanic", 195, "James Cameron");
        Movie movie4 = new Movie("Avatar", 162, "James Cameron");
        Movie movie5 = new Movie("The Godfather", 175, "Francis Ford Coppola");
        
        Customer cus1 = new Customer("Alice", "C001");
        Customer cus2 = new Customer("Bob", "C002");
        Customer cus3 = new Customer("Charlie", "C003");
        Customer cus4 = new Customer("David", "C004");
        Customer cus5 = new Customer("Emma", "C005");
        
        RentalRecord rc1 = new RentalRecord(movie1, 14, cus1);
        RentalRecord rc2 = new RentalRecord(movie2, 7, cus2);
        RentalRecord rc3 = new RentalRecord(movie3, 21, cus3);
        RentalRecord rc4 = new RentalRecord(movie4, 3, cus4);
        RentalRecord rc5 = new RentalRecord(movie5, 10, cus5);
        
        return List.of(rc1, rc2, rc3, rc4, rc5);
    }
    
    public RentalRecord getLongestRental(List<RentalRecord> records) {
        return records.stream()
                .max((r1, r2) -> Integer.compare(r1.getRentalDays(), r2.getRentalDays()))
                .orElse(null);
    }
    
    public RentalRecord getShortestRental(List<RentalRecord> records) {
        return records.stream()
                .min((r1, r2) -> Integer.compare(r1.getRentalDays(), r2.getRentalDays()))
                .orElse(null);
    }
    
    public long countTotalMovies(List<RentalRecord> records) {
        return records.stream()
                .map(RentalRecord::getMovie)
                .distinct()
                .count();
    }
}
