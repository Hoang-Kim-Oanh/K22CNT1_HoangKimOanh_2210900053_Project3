package model;

import java.sql.Timestamp;

public class DangKy_hko {
    private int maKhachDangKy;
    private String hoTen;
    private String soDienThoai;
    private String trangThai;
    private String khoaHoc;
    private Timestamp ngayDangKy;

    public DangKy_hko() {
    }

    public DangKy_hko(int maKhachDangKy, String hoTen, String soDienThoai, String trangThai, String khoaHoc, Timestamp ngayDangKy) {
        this.maKhachDangKy = maKhachDangKy;
        setHoTen(hoTen);
        setSoDienThoai(soDienThoai);
        this.trangThai = trangThai;
        this.khoaHoc = khoaHoc;
        this.ngayDangKy = ngayDangKy;
    }

    public int getMaKhachDangKy() {
        return maKhachDangKy;
    }

    public void setMaKhachDangKy(int maKhachDangKy) {
        this.maKhachDangKy = maKhachDangKy;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        if (hoTen == null || hoTen.trim().isEmpty()) {
            throw new IllegalArgumentException("Họ tên không được để trống");
        }
        this.hoTen = hoTen;
    }

    public String getSoDienThoai() {
        return soDienThoai;
    }

    public void setSoDienThoai(String soDienThoai) {
        if (soDienThoai == null || soDienThoai.trim().isEmpty()) {
            this.soDienThoai = "Chưa cập nhật"; // Default value for null or empty
        } else if (soDienThoai.length() < 9 || soDienThoai.length() > 15) {
            throw new IllegalArgumentException("Số điện thoại phải có từ 9 đến 15 ký tự");
        } else {
            this.soDienThoai = soDienThoai;
        }
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }

    public String getKhoaHoc() {
        return khoaHoc;
    }

    public void setKhoaHoc(String khoaHoc) {
        this.khoaHoc = khoaHoc;
    }

    public Timestamp getNgayDangKy() {
        return ngayDangKy;
    }

    public void setNgayDangKy(Timestamp ngayDangKy) {
        this.ngayDangKy = ngayDangKy;
    }

    @Override
    public String toString() {
        return "DangKy_hko{" +
                "maKhachDangKy=" + maKhachDangKy +
                ", hoTen='" + hoTen + '\'' +
                ", soDienThoai='" + soDienThoai + '\'' +
                ", trangThai='" + trangThai + '\'' +
                ", khoaHoc='" + khoaHoc + '\'' +
                ", ngayDangKy=" + ngayDangKy +
                '}';
    }
}