/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test3;

/**
 *
 * @author DUADEPTRAI
 */
public class Movie {
    private String title;
    private int duration;
    private String director;
    
    public Movie(String title, int duration, String director) {
        this.title = title;
        this.duration = duration;
        this.director = director;
    }
    
    public String getTitle() {
        return title;
    }
    public int getDuration() {
        return duration;
    }
    public String getDirector() {
        return director;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }
    public void setDuration(int duration) {
        this.duration = duration;
    }
    public void setDirector(String director) {
        this.director = director;
    }
    
    @Override
    public String toString() {
        return "Title: " + title + " - Duration: " + duration + " - Director: " + director;
    }
}
