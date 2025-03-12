package model;

public class HocVien_hko {
    private int maHocVien;
    private String tenHocVien;
    private String ngaySinh;
    private String gioiTinh;
    private String diaChi;
    private String email;
    private String lichHoc;
    private double diemSo;
    private String matKhau;

    public HocVien_hko() {
    }

    public HocVien_hko(int maHocVien, String tenHocVien, String ngaySinh, String gioiTinh, String diaChi,
                       String email, String lichHoc, double diemSo, String matKhau) {
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

    public int getMaHocVien() {
        return maHocVien;
    }

    public String getTenHocVien() {
        return tenHocVien;
    }

    public String getNgaySinh() {
        return ngaySinh;
    }

    public String getGioiTinh() {
        return gioiTinh;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public String getEmail() {
        return email;
    }

    public String getLichHoc() {
        return lichHoc;
    }

    public double getDiemSo() {
        return diemSo;
    }

    public String getMatKhau() {
        return matKhau;
    }
}
