package model;

public class TuVanDangKy_hko {
    private int maKhachVangLai;
    private String hoTenKhach;
    private String soDienThoai;
    private String yeuCauTuVan;
    private String ngayDangKy;

    public TuVanDangKy_hko() {
    }

    public TuVanDangKy_hko(int maKhachVangLai, String hoTenKhach, String soDienThoai, String yeuCauTuVan, String ngayDangKy) {
        this.maKhachVangLai = maKhachVangLai;
        this.hoTenKhach = hoTenKhach;
        this.soDienThoai = soDienThoai;
        this.yeuCauTuVan = yeuCauTuVan;
        this.ngayDangKy = ngayDangKy;
    }

    public int getMaKhachVangLai() {
        return maKhachVangLai;
    }

    public void setMaKhachVangLai(int maKhachVangLai) {
        this.maKhachVangLai = maKhachVangLai;
    }

    public String getHoTenKhach() {
        return hoTenKhach;
    }

    public void setHoTenKhach(String hoTenKhach) {
        this.hoTenKhach = hoTenKhach;
    }

    public String getSoDienThoai() {
        return soDienThoai;
    }

    public void setSoDienThoai(String soDienThoai) {
        this.soDienThoai = soDienThoai;
    }

    public String getYeuCauTuVan() {
        return yeuCauTuVan;
    }

    public void setYeuCauTuVan(String yeuCauTuVan) {
        this.yeuCauTuVan = yeuCauTuVan;
    }

    public String getNgayDangKy() {
        return ngayDangKy;
    }

    public void setNgayDangKy(String ngayDangKy) {
        this.ngayDangKy = ngayDangKy;
    }
}