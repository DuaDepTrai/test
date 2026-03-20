/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/WebServices/WebService.java to edit this template
 */
package service;

import dto.DonHangDTO;
import dto.NewDonHangDTO;
import model.DonHang;
import java.util.List;
import java.util.stream.Collectors;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author DUADEPTRAI
 */
@WebService(serviceName = "DonHangService")
public class DonHangService {
    private static final EntityManagerFactory emf = Persistence.createEntityManagerFactory("WS_Lab3_ServerPU");

    private EntityManager getEm() {
        return emf.createEntityManager();
    }

    @WebMethod(operationName = "findAll")
    public List<DonHangDTO> findAll() {
        EntityManager em = getEm();
        try {
            List<DonHang> donHangs = em.createNamedQuery("DonHang.findAll", DonHang.class).getResultList();
            return donHangs.stream().map(this::toDTO).collect(Collectors.toList());
        } finally {
            em.close();
        }
    }

    @WebMethod(operationName = "findById")
    public DonHangDTO findById(@WebParam(name = "id") Integer id) {
        EntityManager em = getEm();
        try {
            if (id == null) throw new RuntimeException("ID là bắt buộc");
            DonHang donHang = em.find(DonHang.class, id);
            if (donHang == null) throw new RuntimeException("Không tìm thấy đơn hàng ID " + id);
            return toDTO(donHang);
        } finally {
            em.close();
        }
    }

    @WebMethod(operationName = "addNew")
    public boolean addNew(@WebParam(name = "newDonHang") NewDonHangDTO newDon) {
        EntityManager em = getEm();
        try {
            DonHang donHang = new DonHang();
            donHang.setTenhang(newDon.getTenhang());
            donHang.setSoluong(newDon.getSoluong());
            donHang.setDongia(newDon.getDongia());
            em.getTransaction().begin();
            em.persist(donHang);
            em.getTransaction().commit();
            return true;
        } catch (Exception e) {
            if (em.getTransaction().isActive()) em.getTransaction().rollback();
            throw new RuntimeException("Thêm đơn hàng thất bại: " + e.getMessage());
        } finally {
            em.close();
        }
    }

    @WebMethod(operationName = "update")
    public boolean update(@WebParam(name = "donHang") DonHangDTO donHangDTO) {
        EntityManager em = getEm();
        try {
            DonHang donHang = em.find(DonHang.class, donHangDTO.getId());
            if (donHang == null) throw new RuntimeException("Không tìm thấy đơn hàng");
            donHang.setTenhang(donHangDTO.getTenhang());
            donHang.setSoluong(donHangDTO.getSoluong());
            donHang.setDongia(donHangDTO.getDongia());
            em.getTransaction().begin();
            em.merge(donHang);
            em.getTransaction().commit();
            return true;
        } catch (Exception e) {
            if (em.getTransaction().isActive()) em.getTransaction().rollback();
            throw new RuntimeException("Cập nhật đơn hàng thất bại: " + e.getMessage());
        } finally {
            em.close();
        }
    }

    @WebMethod(operationName = "delete")
    public boolean delete(@WebParam(name = "id") Integer id) {
        EntityManager em = getEm();
        try {
            DonHang donHang = em.find(DonHang.class, id);
            if (donHang == null) throw new RuntimeException("Không tìm thấy đơn hàng");
            em.getTransaction().begin();
            em.remove(donHang);
            em.getTransaction().commit();
            return true;
        } catch (Exception e) {
            if (em.getTransaction().isActive()) em.getTransaction().rollback();
            throw new RuntimeException("Xóa đơn hàng thất bại: " + e.getMessage());
        } finally {
            em.close();
        }
    }

    private DonHangDTO toDTO(DonHang entity) {
        DonHangDTO dto = new DonHangDTO();
        dto.setId(entity.getId());
        dto.setTenhang(entity.getTenhang());
        dto.setSoluong(entity.getSoluong());
        dto.setDongia(entity.getDongia());
        dto.setTrigia(entity.getTrigia());
        dto.setThue(entity.getThue());
        dto.setCuocchuyencho(entity.getCuocchuyencho());
        dto.setCong(entity.getCong());
        return dto;
    }
}
