package model;

public class DangKy_hko {
    private int maKhachDangKy;
    private String hoTen;
    private String soDienThoai;
    private String trangThai;
    private String khoaHoc;
    private String ngayDangKy;

    public DangKy_hko() {
    }

    public DangKy_hko(int maKhachDangKy, String hoTen, String soDienThoai, String trangThai, String khoaHoc, String ngayDangKy) {
        this.maKhachDangKy = maKhachDangKy;
        this.hoTen = hoTen;
        this.soDienThoai = soDienThoai;
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
        this.hoTen = hoTen;
    }

    public String getSoDienThoai() {
        return soDienThoai;
    }

    public void setSoDienThoai(String soDienThoai) {
        this.soDienThoai = soDienThoai;
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

    public String getNgayDangKy() {
        return ngayDangKy;
    }

    public void setNgayDangKy(String ngayDangKy) {
        this.ngayDangKy = ngayDangKy;
    }
}