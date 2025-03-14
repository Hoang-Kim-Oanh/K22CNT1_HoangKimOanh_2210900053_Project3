package model;

import java.sql.Date;
import java.math.BigDecimal;

public class HocVien_hko {
    private int maHocVien;
    private String tenHocVien;
    private Date ngaySinh;  // Đổi từ String -> Date
    private GioiTinh gioiTinh; // Dùng enum thay cho String
    private String diaChi;
    private String email;
    private String lichHoc;
    private BigDecimal diemSo; // Đổi từ double -> BigDecimal
    private String matKhau;

    // Enum cho giới tính để đồng bộ với ENUM trong DB
    public enum GioiTinh {
        Nam, Nữ, Khác
    }

    public HocVien_hko() {
    }

    public HocVien_hko(int maHocVien, String tenHocVien, Date ngaySinh, GioiTinh gioiTinh, String diaChi,
                       String email, String lichHoc, BigDecimal diemSo, String matKhau) {
        this.maHocVien = maHocVien;
        this.tenHocVien = tenHocVien;
        this.ngaySinh = ngaySinh;
        this.gioiTinh = gioiTinh;
        this.diaChi = diaChi;
        this.email = email;
        this.lichHoc = lichHoc;
        this.diemSo = diemSo;
        this.matKhau = matKhau;
    }

    // Getters và Setters
    public int getMaHocVien() {
        return maHocVien;
    }

    public void setMaHocVien(int maHocVien) {
        this.maHocVien = maHocVien;
    }

    public String getTenHocVien() {
        return tenHocVien;
    }

    public void setTenHocVien(String tenHocVien) {
        this.tenHocVien = tenHocVien;
    }

    public Date getNgaySinh() {
        return ngaySinh;
    }

    public void setNgaySinh(Date ngaySinh) {
        this.ngaySinh = ngaySinh;
    }

    public GioiTinh getGioiTinh() {
        return gioiTinh;
    }

    public void setGioiTinh(GioiTinh gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getLichHoc() {
        return lichHoc;
    }

    public void setLichHoc(String lichHoc) {
        this.lichHoc = lichHoc;
    }

    public BigDecimal getDiemSo() {
        return diemSo;
    }

    public void setDiemSo(BigDecimal diemSo) {
        this.diemSo = diemSo;
    }

    public String getMatKhau() {
        return matKhau;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }
}
