/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test2;

import java.util.*;

/**
 *
 * @author DUADEPTRAI
 */
public class MovieManage {
    public List<Movie> movies() {
        Movie movie1 = new Movie(1, "The Shawshank Redemption", 142);
        Movie movie2 = new Movie(2, "The Godfather", 175);
        Movie movie3 = new Movie(3, "The Dark Knight", 152);
        Movie movie4 = new Movie(4, "Pulp Fiction", 154);
        Movie movie5 = new Movie(5, "The Lord of the Rings: The Return of the King", 201);
        Movie movie6 = new Movie(6, "Forrest Gump", 142);
        Movie movie7 = new Movie(7, "Inception", 148);
        Movie movie8 = new Movie(8, "Fight Club", 139);
        Movie movie9 = new Movie(9, "Interstellar", 169);
        Movie movie10 = new Movie(10, "The Matrix", 136);
        
        return List.of(movie1, movie2, movie3, movie4, movie5, 
                movie6, movie7, movie8, movie9, movie10);
    }
    
    public Movie getLongestMovie(List<Movie> movies) {
        return movies.stream()
                .max((t1, t2) -> Integer.compare(t1.getDuration(), t2.getDuration()))
                .orElse(null);
    }
    
    public Movie getShortestMovie(List<Movie> movies) {
        return movies.stream()
                .min((t1, t2) -> Integer.compare(t1.getDuration(), t2.getDuration()))
                .orElse(null);
    }
    
    public long countMovies(List<Movie> movies) {
        return movies.stream()
                .map(Movie::getTitle)
                .distinct()
                .count();
    }
}
