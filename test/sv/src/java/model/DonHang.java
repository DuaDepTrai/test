/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.beans.Transient;
import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author DUADEPTRAI
 */
@Entity
@Table(name = "donhang")
@NamedQueries({
    @NamedQuery(name = "DonHang.findAll", query = "SELECT d FROM DonHang d"),
    @NamedQuery(name = "DonHang.findById", query = "SELECT d FROM DonHang d WHERE d.id = :id"),
    @NamedQuery(name = "DonHang.findByTenhang", query = "SELECT d FROM DonHang d WHERE d.tenhang = :tenhang"),
    @NamedQuery(name = "DonHang.findBySoluong", query = "SELECT d FROM DonHang d WHERE d.soluong = :soluong"),
    @NamedQuery(name = "DonHang.findByDongia", query = "SELECT d FROM DonHang d WHERE d.dongia = :dongia")})
public class DonHang implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "tenhang", length = 100)
    private String tenhang;

    @Column(name = "soluong")
    private Integer soluong;

    @Column(name = "dongia")
    private Float dongia;

    public DonHang() {
    }

    // Getter & Setter
    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }
    public String getTenhang() { return tenhang; }
    public void setTenhang(String tenhang) { this.tenhang = tenhang; }
    public Integer getSoluong() { return soluong; }
    public void setSoluong(Integer soluong) { this.soluong = soluong; }
    public Float getDongia() { return dongia; }
    public void setDongia(Float dongia) { this.dongia = dongia; }

    // Transient fields (tính toán)
    @Transient
    public Float getTrigia() {
        return (soluong != null && dongia != null) ? soluong * dongia : 0f;
    }

    @Transient
    public Float getThue() {
        return getTrigia() * 0.05f;
    }

    @Transient
    public Float getCuocchuyencho() {
        return (soluong != null) ? soluong * 1500f : 0f;
    }

    @Transient
    public Float getCong() {
        return getTrigia() + getThue() + getCuocchuyencho();
    }
}
