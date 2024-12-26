/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test2;

/**
 *
 * @author DUADEPTRAI
 */
public class Movie {
    private int id;
    private String title;
    private int duration;
    
    public Movie(int id, String title,  int duration) {
        this.id = id;
        this.title = title;
        this.duration = duration;
    }
    
    public int getId() {
        return id;
    }
    public String getTitle() {
        return title;
    }
    public int getDuration() {
        return duration;
    }
    
    public void setId( int id) {
        this.id = id;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public void setDuration(int duration) {
        this.duration = duration;
    }
    
    @Override
    public String toString() {
        return "ID: " + id + " - Title: " + title + " - Duration: " + duration;
    }
}
