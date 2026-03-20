/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

/**
 *
 * @author DUADEPTRAI
 */
public class DonHangDTO {
    private Integer id;
    private String tenhang;
    private Integer soluong;
    private Float dongia;
    private Float trigia;
    private Float thue;
    private Float cuocchuyencho;
    private Float cong;

    // Getter & Setter
    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }
    public String getTenhang() { return tenhang; }
    public void setTenhang(String tenhang) { this.tenhang = tenhang; }
    public Integer getSoluong() { return soluong; }
    public void setSoluong(Integer soluong) { this.soluong = soluong; }
    public Float getDongia() { return dongia; }
    public void setDongia(Float dongia) { this.dongia = dongia; }
    public Float getTrigia() { return trigia; }
    public void setTrigia(Float trigia) { this.trigia = trigia; }
    public Float getThue() { return thue; }
    public void setThue(Float thue) { this.thue = thue; }
    public Float getCuocchuyencho() { return cuocchuyencho; }
    public void setCuocchuyencho(Float cuocchuyencho) { this.cuocchuyencho = cuocchuyencho; }
    public Float getCong() { return cong; }
    public void setCong(Float cong) { this.cong = cong; }
}
