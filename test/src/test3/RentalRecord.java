/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test3;

/**
 *
 * @author DUADEPTRAI
 */
public class RentalRecord {
    private Movie movie;
    private int rentalDays;
    private Customer customer;
    
    public RentalRecord(Movie movie, int rentalDays, Customer customer) {
        this.movie = movie;
        this.rentalDays = rentalDays;
        this.customer = customer;
    }
    
    public Movie getMovie() {
        return movie;
    }
    public int getRentalDays() {
        return rentalDays;
    }
    public Customer getCustomer() {
        return customer;
    }
    
    public void setMovie(Movie movie) {
        this.movie = movie;
    }
    public void setRentalDays(int rentalDays) {
        this.rentalDays = rentalDays;
    }
    public void setCustomer(Customer customer) {
        this.customer = customer;
    }
}
