package model;

public class DangNhapHocVien_hko {
    private int maHocVien;
    private String tenHocVien;
    private String matKhau;

    public DangNhapHocVien_hko(int maHocVien, String tenHocVien, String matKhau) {
        this.maHocVien = maHocVien;
        this.tenHocVien = tenHocVien;
        this.matKhau = matKhau;
    }

    public int getMaHocVien() {
        return maHocVien;
    }

    public String getTenHocVien() {
        return tenHocVien;
    }

    public String getMatKhau() {
        return matKhau;
    }
}
