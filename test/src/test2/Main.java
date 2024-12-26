/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test2;

import java.util.List;

/**
 *
 * @author DUADEPTRAI
 */
public class Main {
    public static void main(String[] args) {
        MovieManage movie = new MovieManage();
        
        List<Movie> movies = movie.movies();
        
        Movie longestMovie = movie.getLongestMovie(movies);
        System.out.println("Longest Movie: " + longestMovie.getTitle()
                            + " - Duration: " + longestMovie.getDuration());
        
        Movie shortestMovie = movie.getShortestMovie(movies);
        System.out.println("Shortest Movie: " + shortestMovie.getTitle()
                            + " - Duration: " + shortestMovie.getDuration());
        
        long count = movie.countMovies(movies);
        System.out.println("Total movies: " + count);
    }
}
