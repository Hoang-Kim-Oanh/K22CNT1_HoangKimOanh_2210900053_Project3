package model;

public class DangNhapHocVien_hko {
    private int maHocVien;
    private String tenHocVien;
    private String matKhau;
    private String ngayDangKy;

    public DangNhapHocVien_hko() {
    }

    public DangNhapHocVien_hko(int maHocVien, String tenHocVien, String matKhau, String ngayDangKy) {
        this.maHocVien = maHocVien;
        this.tenHocVien = tenHocVien;
        this.matKhau = matKhau;
        this.ngayDangKy = ngayDangKy;
    }

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

    public String getMatKhau() {
        return matKhau;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    public String getNgayDangKy() {
        return ngayDangKy;
    }

    public void setNgayDangKy(String ngayDangKy) {
        this.ngayDangKy = ngayDangKy;
    }
}